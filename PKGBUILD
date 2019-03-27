# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=icon-slicer
pkgver=0.3
pkgrel=2
pkgdesc="Utility for generating icon themes and libXcursor cursor themes"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/icon-slicer/"
license=('MIT')
depends=('gdk-pixbuf2' 'popt' 'xorg-xcursorgen')
source=(https://freedesktop.org/software/icon-slicer/releases/$pkgname-$pkgver.tar.gz
        hotspotfix.patch)
sha256sums=('05f0216dd0c25a17859de66357f64da5033375b6fbf5f31ca54867311160b64d'
            '7000ab887b247f24d22ba225934028b1f5b04c1fb8ceac04d01e925b7a602dd0')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../hotspotfix.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # License
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  sed '/License/,$!d' README >"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
