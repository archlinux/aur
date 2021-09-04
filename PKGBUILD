# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=caja-admin
pkgver=0.0.5
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
sha512sums=('494b88c9cbf1ec56d14e6b2463817f606c3362c9b84ef4d75ff60189bc5498c76d712cd68fa6cf188a1e4c708dd3cb9b49eb08ea12c624fee3a6955669837a19')

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
