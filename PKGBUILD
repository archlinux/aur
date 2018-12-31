# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=spt
pkgver=0.4
pkgrel=1
pkgdesc='Simple pomodoro timer that doubles your efficiency'
arch=('x86_64')
url=https://github.com/pickfire/spt
license=('MIT')
depends=('libnotify')
source=("$url/archive/$pkgver/spt-$pkgver.tar.gz")
sha512sums=('993fad0a811fb90143c80bc79a823864f0d2fc7897d6e1290bfe2327e780e78a29a5d286045c6dbcdcece9a03e19c42782f731a109d1c14e6cb001ef43a77068')

prepare() {
  cd spt-$pkgver
  sed -i 's/CPPFLAGS =/CPPFLAGS +=/' config.mk
}

build() {
  cd spt-$pkgver
  make
}

package() {
  cd spt-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/licenses/spt LICENSE
}
