# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=ovpm
pkgver=0.2.12
pkgrel=4
pkgdesc="OpenVPN Management Server - Effortless and free OpenVPN server administration tool"
arch=('x86_64' 'aarch64')
url="https://github.com/cad/ovpm"
license=('AGPL-3.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='2197e9a44c73a9529e1e2a706149f35b1d353607'
source=("git+https://github.com/cad/ovpm.git#commit=$_commit")
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
    ./cmd/ovpm
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
