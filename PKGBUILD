# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=iftree
pkgver=0.0.10
pkgrel=4
pkgdesc="iftree help understand container networks by visualizing network interfaces( veth bridge lo ) relation , output in text, table, images and dot language."
arch=('x86_64' 'aarch64')
url="https://github.com/t1anz0ng/iftree"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='98b48988d2737c572ad7694089c9e502ac9b73e5'
source=("git+https://github.com/t1anz0ng/iftree.git#commit=$_commit")
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
    ./cmd/iftree
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
