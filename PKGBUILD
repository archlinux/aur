# Maintainer Nathan Fisher <jeang3nie at hitchhiker-linux dot org>
pkgname=eva-browser
pkgver=0.4.0
pkgrel=1
pkgdesc='A gemini browser in Gtk4'
arch=('x86_64')
url='https://codeberg.org/jeang3nie/eva'
license=('GPL3')
depends=('gtk4')
makedepends=('rust')
source=("https://codeberg.org/jeang3nie/eva/archive/v$pkgver.tar.gz")
sha512sums=(
  'da02703b275450d83f051bf33b2be4595e41592e397bab242e2eac23a1a12b8583142d6a5d7338231689f2ff45756214b0e542e2295f713d649ae5e0dc35133f'
)

build() {
  cd eva
  cargo build --release
  cargo xtask dist
}

package() {
  install -d $pkgdir/usr
  cd eva
  cp -R target/dist/* $pkgdir/usr
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}
