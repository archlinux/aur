# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=trice
pkgver=1.3.0
pkgrel=2
pkgdesc="🟢 super fast 🚀 tiny 🐥 𝘾 printf-look-and-feel ✍ trace code, in ⚡ interrupts ⚡ too ‼️, and real-time PC 💻 logging 👀"
arch=('x86_64' 'aarch64')
url="https://github.com/rokath/trice"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='54ce845b069f989bfc762f28f6dd364954e6050f'
source=("git+https://github.com/rokath/trice.git#commit=$_commit")
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
    ./cmd/trice
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
