# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=go-grip
pkgver=0.5.6
pkgrel=3
pkgdesc="Preview Markdown files locally before committing them."
arch=('x86_64' 'aarch64')
url="https://github.com/chrishrb/go-grip"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/chrishrb/go-grip.git#tag=v$pkgver")
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
