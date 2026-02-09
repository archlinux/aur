# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=comigo
pkgver=1.2.17
pkgrel=3
pkgdesc="Comic & Manga Reader in Linux，Windows，MacOS。简单跨平台的漫画阅读器。わかりやすい漫画リーダー。"
arch=('x86_64' 'aarch64')
url="https://github.com/yumenaka/comigo"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/yumenaka/comigo.git#tag=v$pkgver")
sha256sums=('SKIP')

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
