# Maintainer: cemsbr <cems@cemshost.com.br>

pkgname=workmux-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.276
pkgrel=1
pkgdesc='git worktrees + tmux windows for zero-friction parallel dev (prebuilt binary)'
arch=('x86_64' 'aarch64')
url="https://github.com/raine/$_pkgname"
license=('MIT')
depends=('git')
optdepends=(
  'tmux: default multiplexer backend'
  'github-cli: PR checkout'
  'git-delta: enhanced diffs'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-arm64.tar.gz")
sha256sums=('7a87de55d7cb84a5f017db6da9a58e4a7bba563253e9a821a384bb2900fccdf3')
sha256sums_x86_64=('723188028dae85648f0cc9c687d0ddfa4fb2ac94dc913b9c4cd23d22a03766c0')
sha256sums_aarch64=('300caf13714e938943ff71ba5f8078098fc818207834df69fb4ca0170a0b5042')

build() {
  for sh in bash zsh fish; do
    ./$_pkgname completions "$sh" > "$_pkgname.$sh"
  done
}

package() {
  install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 "$_pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  install -Dm644 "$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
}
