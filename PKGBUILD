# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Graeme Gott <graeme@gottcode.org>

_pkgbase=xfce4-whiskermenu-plugin
pkgname=(${_pkgbase}-gtk2)
pkgver=1.7.5
pkgrel=1
pkgdesc="Menu for Xfce4 (GTK2 version)"
arch=('x86_64')
url='https://gottcode.org/xfce4-whiskermenu-plugin/'
groups=('xfce4-goodies')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
license=('GPL2')
depends=('garcon' 'xfce4-panel')
makedepends=('cmake' 'ninja')
source=("http://archive.be.xfce.org/src/panel-plugins/xfce4-whiskermenu-plugin/${pkgver%.*}/xfce4-whiskermenu-plugin-$pkgver.tar.bz2") # no https available
sha256sums=('9b60dd29be7ce315a6a8506337bbcbfe39a401ac2beddf2a611e865cc5733de6')

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgbase-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -GNinja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
