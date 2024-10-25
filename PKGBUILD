# Maintainer: Justin Dickey <justin.dickey.eg@gmail.com>

pkgname=goplaying-git
pkgver=0
pkgrel=1
pkgdesc="A basic Now Playing TUI written in Go"
arch=('x86_64')
url="https://github.com/justinmdickey/goplaying"
license=('MIT')
depends=('go' 'playerctl')
makedepends=('go' 'git')
provides=('goplaying')
conflicts=('goplaying')
source=("git+https://github.com/justinmdickey/goplaying.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  go build -v -o goplaying .
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 goplaying "$pkgdir/usr/bin/goplaying"
}

# Optional: Include necessary docs, like LICENSE if relevant
install_license() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
