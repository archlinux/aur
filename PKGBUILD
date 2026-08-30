# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=paclear
pkgver=0.0.13
pkgrel=4
pkgdesc="👾paclear is a clear command with PAC-MAN animation👾"
arch=('x86_64' 'aarch64')
url="https://github.com/orangekame3/paclear"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='250b7067139b8a99fd40b50d87114d19b650e73f'
source=("git+https://github.com/orangekame3/paclear.git#commit=$_commit")
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
