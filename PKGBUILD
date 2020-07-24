# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=paletti
_pkgname=Paletti
pkgver=2.0
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Create a color palette from an image"
url="https://github.com/Eroica/Paletti"
license=('custom')
depends=('gtk3' 'leptonica')
makedepends=('meson' 'vala')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f5a4a6c3c5d3bde8e92d8923ee103cf67884a4d0b6cedf671092840d71594ec4f171a4b7f032092fc25abf5941668c7216d1ff2917fd9f605487cacaea3f7ad9')

prepare() {
  cd "$_pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$_pkgname-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$_pkgname-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
  install -Dm 644 LICENSE \
                  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 dist/com.moebots.Paletti.desktop \
                  "$pkgdir/usr/share/applications/com.moebots.Paletti.desktop"
  install -Dm 644 dist/com.moebots.Paletti.png \
                  "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.moebots.Paletti.png"
  install -Dm 644 dist/com.moebots.Paletti-symbolic.svg \
                  "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.moebots.Paletti-symbolic.svg"
}
