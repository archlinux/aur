# Maintainer: Thomas Herrle <th-arch@pm.me>
pkgname=fabric-git
pkgver=r1584.0b26b93
pkgrel=1
pkgdesc="An open-source framework for augmenting humans using AI"
arch=('x86_64')
url="https://github.com/danielmiessler/fabric"
license=('MIT')
depends=('go')
makedepends=('git')
provides=('fabric-ai')
conflicts=('fabric-ai')
source=("git+https://github.com/danielmiessler/fabric.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/fabric"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/fabric"
  go build -o fabric
}

package() {
  cd "$srcdir/fabric"
  install -Dm755 fabric "$pkgdir/usr/bin/fabric"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
