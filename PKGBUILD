# Maintainer: Denis Sheremet <zaycakitayca@xaker.ru>
pkgname=gnome-menu-editor-qt
pkgver=r8.7e7a536
pkgrel=1
pkgdesc="Simple alacarte replacement, written on qt. Gnome menu editor for systems with no gtk3 support"
url="http://lxlz.tk"
arch=('x86_64' 'i686')
license=('custom:WTFPL')
depends=('qt5-base')
optdepends=()
makedepends=("git")
conflicts=()
replaces=()
backup=()
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/zaycakitayca/${pkgname}"
		"${pkgname}.desktop")
md5sums=("SKIP"
		 "99b1932ce5a7ad4b40961791702de820")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake gnome-menu-editor-qt.pro
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 "../${pkgname}.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}



