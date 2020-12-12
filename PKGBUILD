# Contributor: orhun <orhunparmaksiz@gmail.com>

pkgname=faint-git
pkgdesc="Extensible TUI fuzzy file explorer (git)"
pkgver=1.0.r0.g531da62
pkgrel=1
arch=('x86_64')
url="https://github.com/salman-abedin/faint"
license=('GPL2')
depends=('fzf')
makedepends=('make' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags $(git rev-list --tags --max-count=1) | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  make BIN_DIR="$pkgdir/usr/bin" install
  install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
