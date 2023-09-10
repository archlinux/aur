# Maintainer: Tobias Killer <tokidev at posteo dot de>
pkgname=ddpolymerase
pkgver=0.2.0
pkgrel=1
pkgdesc="Copy, repair and verify a file"
arch=('x86_64')
url="https://codeberg.org/tokideveloper/ddpolymerase"
license=('GPL3')
depends=('coreutils' 'util-linux')
makedepends=('cargo')
source=("$pkgname-v$pkgver.tar.gz::https://codeberg.org/tokideveloper/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('6c9e8c7e79638a6d72e8fe56d844b091510b981706b9423a8067dbb79b9e4ab1812ddb338f68c3490554711b5dedc6877fa3a07e78d50df48f13c911969fdaa5')

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

  install -Dm644 "bash-completion/completions/ddpolymerase" "$pkgdir/usr/share/bash-completion/completions/ddpolymerase"

  install -Dm644 "man/ddpolymerase.1" "$pkgdir/usr/share/man/man1/ddpolymerase.1"

  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CREDITS.md" "$pkgdir/usr/share/doc/${pkgname}/CREDITS.md"
  install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG.md"
}
