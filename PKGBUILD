# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=wxgtk
pkgname=$_pkgname-git
pkgver=46953a1
pkgrel=3
pkgdesc='Cross-Platform GUI Library - GTK+ port'
arch=("i686" "x86_64")
url='https://www.wxwidgets.org'
license=("custom: wxWindows Library Licence")
depends=('gtk2' 'webkitgtk2' 'libmspack' 'gstreamer0.10-base' 'libnotify')
makedepends=('git' 'glu')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+https://github.com/wxWidgets/wxWidgets.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure --prefix=/usr --with-gtk=2 --with-libmspack
  make
  make -C locale allmo
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -D -m644 docs/licence.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
