# Maintainer: kantiankant <qwerasdnoob@gmail.com>
pkgname=musicwidget
pkgver=1.0.0
pkgrel=1
pkgdesc="A music widget written in C because I thought it'd be funny"
arch=('x86_64')
url="https://github.com/kantiankant/musicwidget"
license=('GPL')
depends=('wayland' 'cairo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kantiankant/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0be51dcab022d75234c1e8446a43670bac074ca134b9f423565ec0273ba763d6')

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
