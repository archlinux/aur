# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=gh-eco
pkgver=0.1.5
pkgrel=3
pkgdesc="🦎 gh cli extension to explore the ecosystem"
arch=('x86_64' 'aarch64')
url="https://github.com/jrnxf/gh-eco"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/jrnxf/gh-eco.git#tag=v$pkgver")
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
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
