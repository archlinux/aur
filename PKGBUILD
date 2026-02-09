# Maintainer: gomanager <gomanager@generated>
pkgname=vibecheck
pkgver=1.7.7
pkgrel=2
pkgdesc="vibecheck is a lightweight, cross-platform command line AI-tool that automatically generates meaningful and consistent Git Commit Messages by analyzing your code changes — ship faster with vibecheck"
arch=('x86_64' 'aarch64')
url="https://github.com/rshdhere/vibecheck"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/rshdhere/vibecheck.git#tag=v$pkgver")
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
