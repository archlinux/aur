# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=caja-admin
pkgver=0.0.4
pkgrel=1
pkgdesc="Extension for Caja to do administrative operations"
arch=('any')
url="https://github.com/infirit/$pkgname"
license=('GPL3')
depends=('caja' 'python-caja' 'polkit')
makedepends=('meson' 'gettext')
optdepends=('pluma: to use the "Edit as Administrator" action'
            'mate-terminal: to use the "Run as Administrator" action')
source=("https://github.com/infirit/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('2aaa9c745e0532e2d1727382c89bfd679d5ae61e1aba78a41694f3c5c804d9f88424b60a2c412bb940b4df9a056bb73b195fc59dfc48827763dc7fb3678a0ac1')

build() {
  cd "$pkgname-$pkgver"
  meson --prefix=/usr --buildtype=plain build
  meson compile -C build/
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "NEWS" "$pkgdir/usr/share/doc/$pkgname/NEWS"
  install -Dm644 "AUTHORS" "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
}
