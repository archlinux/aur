# Maintainer: Piotr Krzemiński <pio.krzeminski@gmail.com>

pkgname=thinkgui
pkgver=20150513
pkgrel=3
pkgdesc="GUI toolkit for ThinkPad laptops"
arch=('i686' 'x86_64')
url="https://github.com/krzemin/thinkgui"
license=('GPL3')
depends=('qt5-base>=5.4.0')
makedepends=('git')
source=('git://github.com/krzemin/thinkgui.git'
        'thinkgui-fix-cpu-permissions.sh')
md5sums=('SKIP'
         '74db2ed6fc59f47b50960fe5b7f4d652')
options=('docs')

_gitname="thinkgui"

build() {
  cd "$_gitname"
  qmake-qt5 || return 1
  make -j2 || return 1
}

package() {
  cd "$_gitname"
  make INSTALL_ROOT="$pkgdir/" install
  install -D -m755 "$srcdir/thinkgui-fix-cpu-permissions.sh" "$pkgdir/usr/lib/systemd/system-sleep/thinkgui-fix-cpu-permissions.sh"
}

