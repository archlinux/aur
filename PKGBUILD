# Maintainer: Justin ! <just1602@riseup.net>

pkgname='tailspin'
pkgver=1.6.1
pkgrel=1
pkgdesc='tailspin - A log file highlighter'
url='https://github.com/bensadeh/tailspin'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
makedepends=('cargo')
b2sums=('fcbfaea99b4db61609ddaafcd7329700718de20d9ad7370092887d11ed5d208c07cc996f8308d4c39647b5dc1d1850dd1cf27081f3a5e36603052e08169d4363')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --locked --release --color auto --target-dir target
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --locked --release --color auto --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/spin "${pkgdir}/usr/bin/spin"
  install -Dm644 man/spin.1 "$pkgdir/usr/share/man/man1/spin.1"
  install -Dm644 completions/spin.bash "$pkgdir/usr/share/bash-completion/completions/spin"
  install -Dm644 completions/spin.zsh "$pkgdir/usr/share/zsh/site-functions/_spin"
  install -Dm644 completions/spin.fish "$pkgdir/usr/share/fish/vendor_completions.d/spin.fish"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/$pkgname/LICENCE"
}
