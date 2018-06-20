# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=python2-libvmi-git
pkgver=6e38865
pkgrel=1
pkgdesc='Libvmi Python2 bindings'
url='http://libvmi.com'
arch=('any')
license=('GPLv3')
makedepends=('python2-pkgconfig')
depends=('python2-cffi' 'python2-future' 'libvmi')
source=("${pkgname}::git+https://github.com/libvmi/python.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --always --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  python2 setup.py build
}

package() {
  cd ${pkgname}
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
