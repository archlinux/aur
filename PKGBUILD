# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=gowsdl
pkgver=0.5.0
pkgrel=4
pkgdesc="WSDL2Go code generation as well as its SOAP proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/hooklift/gowsdl"
license=('MPL-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='51f3ef6c0e8f41ed1bdccce4c04e86b6769da313'
source=("git+https://github.com/hooklift/gowsdl.git#commit=$_commit")
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
    ./cmd/gowsdl
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
