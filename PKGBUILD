# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=brev-cli
pkgver=0.6.334
pkgrel=2
pkgdesc="Connect your laptop to cloud computers. Follow to stay updated about our product"
arch=('x86_64' 'aarch64')
url="https://github.com/brevdev/brev-cli"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='81eb373cd3f2b57b8a03a1d62ee09531c04e5ab3'
source=("git+https://github.com/brevdev/brev-cli.git#commit=$_commit")
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
