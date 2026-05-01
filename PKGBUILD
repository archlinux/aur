pkgname=extend-cli-git
pkgver=v0.1.14.r1.3b1eed1
pkgrel=1
pkgdesc="CLI for the Extend document processing platform"
arch=('x86_64')
url="https://github.com/extend-hq/extend-cli"
license=('MIT')
makedepends=('go' 'git')
provides=('extend-cli')
conflicts=('extend-cli')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "extend-cli"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "extend-cli"
  go build -o extend-cli ./cmd/extend
}

package() {
  cd "extend-cli"
  install -Dm755 extend-cli "$pkgdir/usr/bin/extend-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
