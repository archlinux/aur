# Maintainer: Maximilian Roos <m@maxroos.com>
pkgname=worktrunk-bin
pkgver=0.15.2
pkgrel=1
pkgdesc="CLI for git worktree management, designed for running AI agents in parallel"
arch=('x86_64' 'aarch64')
url="https://github.com/max-sixty/worktrunk"
license=('MIT OR Apache-2.0')
provides=('worktrunk')
conflicts=('worktrunk')
source_x86_64=("https://github.com/max-sixty/worktrunk/releases/download/v${pkgver}/worktrunk-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("https://github.com/max-sixty/worktrunk/releases/download/v${pkgver}/worktrunk-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('3e5f3bb1f7792dc1b2be70a1b49b9a537badbae3d1da97425fe5ce172b6e0dd7')
sha256sums_aarch64=('fdff285dc09c74541e8d3660d7437ba87dae89844ae963b477ae1f4f24e5b515')

package() {
  cd "worktrunk-$CARCH-unknown-linux-musl"
  install -Dm755 wt "$pkgdir/usr/bin/wt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Fish completions
  # TODO: a bit hacky, but short enough that copy & paste is OK for the moment
  install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/wt.fish" <<'EOF'
# worktrunk completions for fish
complete --keep-order --exclusive --command wt --arguments "(test -n \"\$WORKTRUNK_BIN\"; or set -l WORKTRUNK_BIN (type -P wt 2>/dev/null); and COMPLETE=fish \$WORKTRUNK_BIN -- (commandline --current-process --tokenize --cut-at-cursor) (commandline --current-token))"
EOF
}
