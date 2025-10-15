# Maintainer: Benjamin Chausse <benjamin@chausse.xyz>

pkgname=termpicker-git
pkgver=v1.4.1.r7.gf4a7a02
pkgrel=1
pkgdesc="A color picker for the terminal"
arch=('x86_64')
url="https://github.com/ChausseBenjamin/termpicker"
license=('Beerware')
depends=()
makedepends=('git' 'go')
optdepends=(
  'wl-clipboard: clipboard support on wayland'
  'xsel: clipboard support on X11'
)
provides=('termpicker')
conflicts=('termpicker' 'termpicker-bin')
source=("${pkgname}::git+https://github.com/ChausseBenjamin/termpicker.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname}"
  go generate ./...
  go build -o termpicker .
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm755 termpicker "${pkgdir}/usr/bin/termpicker"
  install -Dm644 internal/documentation/termpicker.1 "${pkgdir}/usr/share/man/man1/termpicker.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
