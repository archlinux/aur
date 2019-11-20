# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname=magic-wormhole-git
_pkgname=${pkgname%-*}
pkgver=0.11.2.r82.995d3f5
pkgrel=2
pkgdesc="Securely transfer data between computers"
arch=('any')
url="https://github.com/warner/${_pkgname}"
license=('MIT')
depends=('python' 'python-click' 'python-cffi' 'python-autobahn' 'python-tqdm' 'python-hkdf' 'python-pynacl' 'python-spake2' 'python-humanize' 'python-idna' 'python-service-identity' 'python-txtorcon' 'python-pyhamcrest')
makedepends=('python-setuptools')
source=("git+${url}.git" "magic-wormhole-git.patch")
conflicts=("wormhole" "wormhole-server")
provides=("wormhole" "wormhole-server")
sha512sums=('SKIP'
            'b93a25d041c6cded94eed8951d448bf84373516e49498289275e080cba487ea6905128b83c1f7ccb635f1f8045bcdefa0bce6ef9d493060c85b177d65011bbf2')

pkgver()
{
  cd "${srcdir}/${_pkgname}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	patch < "magic-wormhole-git.patch" "$srcdir/$_pkgname/setup.py"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
