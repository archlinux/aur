# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=gitcs
pkgver=1.2.2
pkgrel=2
pkgdesc="📈 Command line tool written in Go. It allows developers to scan their local Git repositories and generate a visual contributions graph."
arch=('x86_64' 'aarch64')
url="https://github.com/hrtsegv/gitcs"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='c41bdc46a795d93a7e049585a3fd3ad619db8f90'
source=("git+https://github.com/hrtsegv/gitcs.git#commit=$_commit")
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
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
