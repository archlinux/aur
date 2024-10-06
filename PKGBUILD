# Maintainer: Your Name <your.email@example.com>

pkgbase=ligolo-ng
pkgname=('ligolo-ng-git')
pkgver=1.0.0.r5.g1234567 # Adjust after first build
pkgrel=1
pkgdesc="A simple, light and fast reverse proxy for pentesters"
arch=('x86_64')
url="https://github.com/nicocha30/ligolo-ng"
license=('GPL')
depends=('go')
makedepends=('git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make linux
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 dist/ligolo-ng-proxy-linux_amd64 "$pkgdir/usr/bin/ligolo-ng-proxy"
  install -Dm755 dist/ligolo-ng-agent-linux_amd64 "$pkgdir/usr/bin/ligolo-ng-agent"
}


