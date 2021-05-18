# Maintainer: Marco R. <thomasschmidt45@gmx.net>
pkgname=friendiqa
pkgver=0.6
pkgrel=1
pkgdesc="Client for social network Friendica"
arch=('any')
url="https://git.friendi.ca/lubuwest/Friendiqa"
license=('GPL3')
makedepends=('cmake')
depends=('qt5-base' 'qt5-declarative' 'qt5-multimedia' 'qt5-quickcontrols2' 'qt5-webview' )
source=("$pkgname-$pkgver.tar.gz::https://git.friendi.ca/lubuwest/Friendiqa/archive/v${pkgver}.tar.gz")
md5sums=('ab310a7b9b4256afb99e30697f2dfe0e') #generate with 'makepkg -g'

build() {
  cd "$pkgname/source-linux"
  cmake -B build -S "friendiqa\source-linux" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
  make
}

package() {
  cd "$pkgname/source-linux"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 "$srcdir"/images/de.ma-nic.Friendiqa.desktop "$pkgdir"/usr/share/applications/de.ma-nic.Friendiqa.desktop
  install -Dm644 "$srcdir"/images/Friendiqa.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/Friendiqa.svg
}

# vim:set ts=2 sw=2 et:
