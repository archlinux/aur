# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=zeit
pkgver=1.0.1
pkgrel=2
pkgdesc="Zeit, erfassen. A command line tool for tracking time. (https://codeberg.org/mrus/zeit)"
arch=('x86_64' 'aarch64')
url="https://github.com/mrusme/zeit"
license=('unknown')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/mrusme/zeit.git#tag=v$pkgver")
sha256sums=('SKIP')

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
