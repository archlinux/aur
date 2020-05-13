# Maintainer: Farouk Mokhtari <faroukmokh@gmail.com>
pkgname=dmenu-duncan-git
_pkgname=dmenu-duncan
pkgver=4.9.r577.6ab3117
pkgrel=1
pkgdesc="dmenu suckless application launcher with password support"
arch=('i686' 'x86_64')
url="https://github.com/duncan-f/dmenu.git"
license=('MIT')
depends=('libxft')
makedepends=('git')
provides=('dmenu')
conflicts=('dmenu')
source=("${_pkgname}::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  _pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "${_pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
