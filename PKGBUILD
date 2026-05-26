# Maintainer: Harshil Anuwadia <your-email@example.com>
pkgname=archwiki-tui-git
pkgver=0.1.0.beta.1.r1.g617838b
pkgrel=1
pkgdesc="Minimalist terminal browser for the Arch Wiki (Beta)"
arch=('x86_64' 'aarch64')
url="https://github.com/Harshil-Anuwadia/archwiki-tui"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git' 'make')
provides=('archwiki-tui')
conflicts=('archwiki-tui')
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  export GOPATH="$srcdir/gopath"
  make build
}

package() {
  cd "$pkgname"
  install -Dm755 bin/archwiki "$pkgdir/usr/bin/archwiki"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
