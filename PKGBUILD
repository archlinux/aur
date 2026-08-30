# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=kure
pkgver=1.3.0
pkgrel=4
pkgdesc="CLI password manager with sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/GGP1/kure"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='d93570f642ae8cc51f69ca603d2a3f9c0167e593'
source=("git+https://github.com/GGP1/kure.git#commit=$_commit")
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
