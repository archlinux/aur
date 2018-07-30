# Maintainer: Ismael González Valverde <ismgonval@gmail.com>

pkgname=rnr
pkgver=0.1.5
pkgrel=1
pkgdesc='Command-line tool to rename multiple files.'
arch=('x86_64')
url='https://github.com/ChuckDaniels87/rnr'
license=('MIT')
makedepends=('cargo')
source=("https://github.com/ChuckDaniels87/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  # Binary
  install -Dm755 "target/release/rnr" "$pkgdir/usr/bin/rnr"
  # Completion files
	install -Dm644 "target/release/build/rnr-"*/out/_rnr \
    "$pkgdir/usr/share/zsh/site-functions/_rnr"
  install -Dm644 "target/release/build/rnr-"*/out/rnr.bash \
    "$pkgdir/usr/share/bash-completion/completions/rnr"
  install -Dm644 "target/release/build/rnr-"*/out/rnr.fish \
    "$pkgdir/usr/share/fish/completions/rnr.fish"
  # Documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  # License files
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
# vim: ts=2 sw=2 et:
