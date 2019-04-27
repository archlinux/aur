# Maintainer: Antonio O. <antonio.mx.9605 at gmail dot com>

pkgname=wxformbuilder
gitname=wxFormBuilder
pkgver=3.9.0
pkgrel=1
pkgdesc='RAD tool for wxWidgets GUI design'
arch=('i686' 'x86_64')
url=https://github.com/wxFormBuilder/wxFormBuilder
license=('GPL')
provides=('wxformbuilder')
conflicts=('wxformbuilder' 'wxformbuilder-svn' 'wxformbuilder-git')
depends=('wxgtk2')
makedepends=('git' 'ninja' 'meson')
source=('git://github.com/wxFormBuilder/wxFormBuilder.git#tag=v3.9.0')
md5sums=('SKIP')

prepare() {
  cd $srcdir/${gitname}
  git submodule update --init
}

build() {
  cd $srcdir/${gitname}
  meson _build --prefix $srcdir/${gitname}/_install
  ninja -j$(nproc) -C _build install 
}

package() {
  cd $srcdir/${gitname}
  install -Dm 755 -d $pkgdir/usr
  cp -a _install/* $pkgdir/usr
  gendesk -f -n --pkgname $pkgname --pkgdesc "$pkgdesc" --name wxFormBuilder
  install -Dm 644 $srcdir/${gitname}/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm 644 $pkgdir/usr/share/wxformbuilder/resources/icons/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
