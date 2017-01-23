# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname=magic-wormhole-git
_pkgname=${pkgname%-*}
pkgver=0.9.2
pkgrel=2
pkgdesc="Securely transfer data between computers"
arch=('any')
url="https://github.com/warner/${_pkgname}"
license=('MIT')
depends=('python' 'python-click' 'python-cffi' 'python-autobahn' 'python-tqdm' 'python-hkdf' 'python-pynacl' 'python-spake2' 'python-humanize' 'python-idna' 'python-service-identity' 'python-ipaddress')
makedepends=('python-setuptools')
source=("git+${url}.git")
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
