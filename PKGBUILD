# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=poutine
pkgver=1.0.7
pkgrel=3
pkgdesc="boostsecurityio/poutine"
arch=('x86_64' 'aarch64')
url="https://github.com/boostsecurityio/poutine"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/boostsecurityio/poutine.git#tag=v$pkgver")
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
