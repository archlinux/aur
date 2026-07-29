# Maintainer: Tino Gohl <tuvbunn2@googlemail.com>
pkgname=jgrep
pkgver=1.0.2
pkgrel=1
pkgdesc="grep for JSON with jq-style filter expressions (built from source)"
arch=('x86_64')
url="https://github.com/subnix-work/jgrep-tinox"
license=('Apache-2.0')
depends=('glibc' 'gc')
makedepends=('tinox')
source=("$pkgname-$pkgver.tar.gz::https://github.com/subnix-work/jgrep-tinox/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4a7fd51aa64bea40bcc9c4e9e8fabbc437b5fd3a8724da2ae467a52cb4940785')

build() {
  cd "jgrep-tinox-$pkgver"
  tinox build
}

package() {
  cd "jgrep-tinox-$pkgver"
  install -Dm755 jgrep "$pkgdir/usr/bin/jgrep"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  ./jgrep completion bash > jgrep.bash
  ./jgrep completion zsh > _jgrep
  ./jgrep completion fish > jgrep.fish
  install -Dm644 jgrep.bash "$pkgdir/usr/share/bash-completion/completions/jgrep"
  install -Dm644 _jgrep "$pkgdir/usr/share/zsh/site-functions/_jgrep"
  install -Dm644 jgrep.fish "$pkgdir/usr/share/fish/vendor_completions.d/jgrep.fish"
}
