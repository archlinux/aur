# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=htb-cli
pkgver=1.7.0
pkgrel=4
pkgdesc="Interact with Hackthebox using your terminal - Be faster and more competitive !"
arch=('x86_64' 'aarch64')
url="https://github.com/GoToolSharing/htb-cli"
license=('GPL-3.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='35a970d405f721f7ca2aa4d3d1244b6bdae7bb38'
source=("git+https://github.com/GoToolSharing/htb-cli.git#commit=$_commit")
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
