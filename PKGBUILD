# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=ktail
pkgver=1.4.0
pkgrel=4
pkgdesc="A tool to easily tail Kubernetes container logs"
arch=('x86_64' 'aarch64')
url="https://github.com/atombender/ktail"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='83e31bd4ddac89bdf4fc282de91a8e893c693697'
source=("git+https://github.com/atombender/ktail.git#commit=$_commit")
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
