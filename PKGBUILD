pkgname=bubblefetch-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Fast, themeable system information tool built with Go and Bubbletea"
arch=("x86_64" "aarch64")
url="https://github.com/howieduhzit/bubblefetch"
license=("MIT")
depends=()
makedepends=("git" "go")
provides=("bubblefetch")
conflicts=("bubblefetch" "bubblefetch-bin")
source=("git+https://github.com/howieduhzit/bubblefetch.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/bubblefetch"
  git describe --tags --long --abbrev=7 2>/dev/null \
    | sed "s/^v//;s/-/./g"
}

build() {
  cd "$srcdir/bubblefetch"
  go build -o bubblefetch ./cmd/bubblefetch
}

package() {
  cd "$srcdir/bubblefetch"
  install -Dm755 bubblefetch "$pkgdir/usr/bin/bubblefetch"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config.example.yaml "$pkgdir/usr/share/bubblefetch/config.example.yaml"
  install -d "$pkgdir/usr/share/bubblefetch/themes"
  install -m644 themes/*.json "$pkgdir/usr/share/bubblefetch/themes/"
}
