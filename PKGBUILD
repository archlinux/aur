# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=comigo
pkgver=1.3.4
pkgrel=2
pkgdesc="Comic & Manga Reader in Linux，Windows，MacOS。简单跨平台的漫画阅读器。わかりやすい漫画リーダー。"
arch=('x86_64' 'aarch64')
url="https://github.com/yumenaka/comigo"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='71cc6be246c5c945be810a896f4d3fcadb790ba9'
source=("git+https://github.com/yumenaka/comigo.git#commit=$_commit")
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
    -o $pkgname \
    ./cmd/comigo
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
