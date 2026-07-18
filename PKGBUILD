# Maintainer: Tino Gohl <tuvbunn2@googlemail.com>
pkgname=jgrep-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="grep for JSON with jq-style filter expressions (prebuilt binary)"
arch=('x86_64')
url="https://github.com/subnix-work/jgrep-tinox"
license=('Apache-2.0')
depends=('glibc' 'gc')
provides=('jgrep')
conflicts=('jgrep')
source=("https://github.com/subnix-work/jgrep-tinox/releases/download/v${pkgver}/jgrep-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('b0cfbe4d7cf969546ffea4d1485c7fb298c93c228dd4e2ac05634eda79cca463')

package() {
  cd "$srcdir"
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
