# Maintainer: kantiankant <qwerasdnoob@gmail.com>
pkgname=musicwidget
pkgver=1.0.1
pkgrel=1
pkgdesc="A music widget written in C because I thought it'd be funny"
arch=('x86_64')
url="https://github.com/kantiankant/musicwidget"
license=('GPL')
depends=('wayland' 'cairo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kantiankant/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8ac42261288399a2c3fb2afb55c1b3746c363a18d1fd3d7640d82977c66e5791')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gcc -o musicwidget musicwidget.c \
    wlr-layer-shell-unstable-v1-client-protocol.c \
    xdg-shell-client-protocol.c \
    $(pkg-config --cflags --libs wayland-client cairo) \
    -lwayland-cursor -lm -lrt
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 musicwidget "$pkgdir/usr/bin/musicwidget"
}
