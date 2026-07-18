# Maintainer: Tino Gohl <tuvbunn2@googlemail.com>
pkgname=ygrep-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="grep for YAML with jq-style filter expressions (prebuilt binary)"
arch=('x86_64')
url="https://github.com/subnix-work/jgrep-tinox"
license=('Apache-2.0')
depends=('glibc' 'gc')
provides=('ygrep')
conflicts=('ygrep')
source=("https://github.com/subnix-work/jgrep-tinox/releases/download/v${pkgver}/ygrep-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('eba608f23184af27d75a52896cf71d88c21236a46683d816dd88fe99fa6e3679')

package() {
  cd "$srcdir"
  install -Dm755 ygrep "$pkgdir/usr/bin/ygrep"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  ./ygrep completion bash > ygrep.bash
  ./ygrep completion zsh > _ygrep
  ./ygrep completion fish > ygrep.fish
  install -Dm644 ygrep.bash "$pkgdir/usr/share/bash-completion/completions/ygrep"
  install -Dm644 _ygrep "$pkgdir/usr/share/zsh/site-functions/_ygrep"
  install -Dm644 ygrep.fish "$pkgdir/usr/share/fish/vendor_completions.d/ygrep.fish"
}
