# Maintainer: Luke Wilkinson <wilkinsonluke@proton.me>

pkgname=fmp-git
pkgver=1.4.4
pkgrel=1
pkgdesc="A simple secure password manager written in rust."
arch=('x86_64')
url="https://codeberg.org/lwilko/fmp"
conflicts=('fmp-bin')
license=('GPL-3.0')
depends=('gpgme' 'libgpg-error')
makedepends=('cargo')
source=("fmp-$pkgver.tar.gz::https://codeberg.org/lwilko/fmp/archive/v$pkgver.tar.gz")
sha512sums=('a19fb26ea45a6fbd8936cb903b01b025b73d6e1929e92777d41fd1dbb680a7245a108379724b0222c52256011dd2045ce18a7d22f2853e74d09162f8834eac85')

build() {
  cd "fmp-$pkgver"

  cargo build --release
}

package() {
  cd "fmp-$pkgver"

  install -Dm755 "target/release/fmp" "$pkgdir/usr/bin/fmp"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
