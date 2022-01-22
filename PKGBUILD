# Maintainer: Tobias Killer <tokidev at posteo dot de>
pkgname=ddpolymerase
pkgver=0.1.0
pkgrel=1
pkgdesc="Copy, repair and verify a file"
arch=('x86_64')
url="https://codeberg.org/tokideveloper/ddpolymerase"
license=('GPL3')
depends=('coreutils' 'util-linux')
makedepends=('cargo')
source=("$pkgname-v$pkgver.tar.gz::https://codeberg.org/tokideveloper/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('ddd3df3792adf1f7e413855a0e8146ff1bed150490cdab828496dbfe403ad07f320295b180fbb9229aa1c5ae05e6138ff506f90822fa640d05192b9c430a7f20')

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  cargo build --release --frozen
}

package() {
  cd "$pkgname"

  install -Dm755 "target/release/ddpolymerase" "$pkgdir/usr/bin/ddpolymerase"

  install -Dm644 "man/ddpolymerase.1" "$pkgdir/usr/share/man/man1/ddpolymerase.1"

  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CREDITS.md" "$pkgdir/usr/share/doc/${pkgname}/CREDITS.md"
  install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG.md"
}
