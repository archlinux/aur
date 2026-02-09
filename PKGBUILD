# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=iftree
pkgver=0.0.10
pkgrel=3
pkgdesc="iftree help understand container networks by visualizing network interfaces( veth bridge lo ) relation , output in text, table, images and dot language."
arch=('x86_64' 'aarch64')
url="https://github.com/t1anz0ng/iftree"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/t1anz0ng/iftree.git#tag=v$pkgver")
sha256sums=('SKIP')

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
