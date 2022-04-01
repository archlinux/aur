# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=apricots
pkgver=0.2.7
pkgrel=1
pkgdesc="A simple 2D flying/bombing game similar to basic side scrollers"
url="https://github.com/moggers87/apricots"
arch=(x86_64)
license=(GPL2)
depends=(gcc-libs sdl2 freealut hicolor-icon-theme)
makedepends=(git)
_commit=e03bcbeef0b28b361ad2270e31947b0d0ee276a9  # tags/v0.2.7^0
source=("git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $pkgname
  sed -i 's/inline int sign/int sign/' apricots/all.cpp
  autoreconf -fvi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname
  make install prefix="$pkgdir/usr"

  install -Dm644 contrib/apricots.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 contrib/desktop-icon.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/apricots.png"
  install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname"
}
