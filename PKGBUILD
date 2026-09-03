# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>
# noyalib-bin: pre-built noyafmt + noyavalidate from the signed,
# SLSA-attested GitHub Release (musl static — no runtime deps).
pkgname=noyalib-bin
pkgver=0.0.31
pkgrel=1
pkgdesc="YAML formatter (noyafmt) and JSON-Schema validator (noyavalidate) built on the noyalib library"
arch=('x86_64' 'aarch64')
url="https://github.com/sebastienrousseau/noya-cli"
license=('MIT OR Apache-2.0')
provides=('noyafmt' 'noyavalidate')
conflicts=('noyalib')
source_x86_64=("$url/releases/download/v$pkgver/noya-cli-$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/noya-cli-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('fcb74e4bde36ac7b897414aece695ebdb713fc8c5904fbb5f09c9796d00e29de')
sha256sums_aarch64=('3330c272eb5afc1eaef83952b4629cae1ebb11dd6ecd9b116fa5a3c9db098efe')

package() {
  cd "noya-cli-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 noyafmt "$pkgdir/usr/bin/noyafmt"
  install -Dm755 noyavalidate "$pkgdir/usr/bin/noyavalidate"
  install -Dm644 noyafmt.1 "$pkgdir/usr/share/man/man1/noyafmt.1"
  install -Dm644 noyavalidate.1 "$pkgdir/usr/share/man/man1/noyavalidate.1"
  install -Dm644 complete/noyafmt.bash "$pkgdir/usr/share/bash-completion/completions/noyafmt"
  install -Dm644 complete/noyavalidate.bash "$pkgdir/usr/share/bash-completion/completions/noyavalidate"
  install -Dm644 complete/_noyafmt "$pkgdir/usr/share/zsh/site-functions/_noyafmt"
  install -Dm644 complete/_noyavalidate "$pkgdir/usr/share/zsh/site-functions/_noyavalidate"
  install -Dm644 complete/noyafmt.fish "$pkgdir/usr/share/fish/vendor_completions.d/noyafmt.fish"
  install -Dm644 complete/noyavalidate.fish "$pkgdir/usr/share/fish/vendor_completions.d/noyavalidate.fish"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
