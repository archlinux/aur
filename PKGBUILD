# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname=magic-wormhole-git
_pkgname=${pkgname%-*}
pkgver=0.10.0
pkgrel=1
pkgdesc="Securely transfer data between computers"
arch=('any')
url="https://github.com/warner/${_pkgname}"
license=('MIT')
depends=('python' 'python-click' 'python-cffi' 'python-autobahn' 'python-tqdm' 'python-hkdf' 'python-pynacl' 'python-spake2' 'python-humanize' 'python-idna' 'python-service-identity' 'python-ipaddress' 'python-txtorcon')
makedepends=('python-setuptools')
source=("git+${url}.git")
conflicts=("wormhole" "wormhole-server")
provides=("wormhole" "wormhole-server")
md5sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_pkgname}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
