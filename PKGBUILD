# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=gh-markdown-preview
pkgver=1.11.0
pkgrel=4
pkgdesc="GitHub CLI extension to preview Markdown looks like GitHub."
arch=('x86_64' 'aarch64')
url="https://github.com/yusukebe/gh-markdown-preview"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/yusukebe/gh-markdown-preview.git#tag=v$pkgver")
sha256sums=('SKIP')

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
