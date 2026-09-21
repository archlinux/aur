# Maintainer: cemsbr <cems@cemshost.com.br>

pkgname=workmux-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.264
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
sha256sums_x86_64=('a3d173c5f44d886fa6b3815dbdb6ce653e659db376fe48fa93db71bf40d11655')
sha256sums_aarch64=('06c309211a2247f3b15b8b285f112b472c99a7fcbce25042e8756467880e3330')

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
