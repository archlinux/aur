# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=ojosama
pkgver=0.11.0
pkgrel=2
pkgdesc="テキストを壱百満天原サロメお嬢様風の口調に変換します"
arch=('x86_64' 'aarch64')
url="https://github.com/jiro4989/ojosama"
license=('unknown')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/jiro4989/ojosama.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/ojosama
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 README.adoc -t "$pkgdir/usr/share/doc/$pkgname"
}
