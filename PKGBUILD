pkgname=usage-git
pkgver=3.5.3.r786.g2666778
pkgrel=1
pkgdesc="A specification for CLIs (development version)"
arch=('x86_64' 'aarch64')
url="https://github.com/jdx/usage"
license=('MIT')

depends=('gcc-libs')
makedepends=('cargo' 'git' 'rust')

provides=('usage')
conflicts=('usage')

source=("git+https://github.com/jdx/usage.git")
sha256sums=('SKIP')

pkgver() {
  cd usage

  printf "%s.r%s.g%s" \
    "$(git describe --tags --abbrev=0 | sed 's/^v//')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd usage
  cargo build --release --locked
}

package() {
  cd usage

  install -Dm755 target/release/usage \
    "$pkgdir/usr/bin/usage"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
