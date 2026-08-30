# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=ojosama
pkgver=0.11.0
pkgrel=3
pkgdesc="テキストを壱百満天原サロメお嬢様風の口調に変換します"
arch=('x86_64' 'aarch64')
url="https://github.com/jiro4989/ojosama"
license=('unknown')
depends=('glibc')
makedepends=('go' 'git')
_commit='141355a5eab885da07271556bf67548a6dbd4e1c'
source=("git+https://github.com/jiro4989/ojosama.git#commit=$_commit")
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
    ./cmd/ojosama
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 README.adoc -t "$pkgdir/usr/share/doc/$pkgname"
}
