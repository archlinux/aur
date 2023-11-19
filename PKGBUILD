# Maintainer: Justin ! <just1602@riseup.net>

pkgname='tailspin'
pkgver=2.2.0
pkgrel=2
pkgdesc='tailspin - A log file highlighter'
url='https://github.com/bensadeh/tailspin'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
makedepends=('cargo')
b2sums=('0ce03bf9152a2abd3c780396ea563113e4097b188ee779c9649ff8818b22f0269ea87fdd04be18855e99aeba8b9dc556af0f50aa5039bdf38e327f87c88a2911')

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
  install -Dm755 target/release/tspin "${pkgdir}/usr/bin/tspin"
  install -Dm644 man/tspin.1 "$pkgdir/usr/share/man/man1/tspin.1"
  install -Dm644 completions/tspin.bash "$pkgdir/usr/share/bash-completion/completions/tspin"
  install -Dm644 completions/tspin.zsh "$pkgdir/usr/share/zsh/site-functions/_tspin"
  install -Dm644 completions/tspin.fish "$pkgdir/usr/share/fish/vendor_completions.d/tspin.fish"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/$pkgname/LICENCE"
}
