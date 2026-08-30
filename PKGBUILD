# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=gh-markdown-preview
pkgver=1.11.2
pkgrel=1
pkgdesc="GitHub CLI extension to preview Markdown looks like GitHub."
arch=('x86_64' 'aarch64')
url="https://github.com/yusukebe/gh-markdown-preview"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='df155e2440c9be50d32decb35f2a632d7cd200f3'
source=("git+https://github.com/yusukebe/gh-markdown-preview.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname" || exit
  go mod download
}

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o cmd/$pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 cmd/$pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
