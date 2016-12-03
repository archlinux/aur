# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=wxgtk
pkgname=$_pkgname-git
pkgver=r62004.4775853
pkgrel=1
pkgdesc='Cross-Platform GUI Library - GTK+ port'
arch=('i686' 'x86_64')
url='https://www.wxwidgets.org'
license=('custom: wxWindows Library Licence')
depends=('gtk3' 'webkitgtk' 'libmspack' 'gst-plugins-bad' 'libnotify')
makedepends=('git' 'cppunit' 'glu')
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
  ./configure --prefix=/usr --with-gtk=3 --enable-stl --with-libmspack
  make
  make -C locale allmo
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -D -m644 docs/licence.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
