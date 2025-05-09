# Maintainer: prime-run <prime-run@github.com>

pkgname=wallrust-bin
_pkgname=wallrust
pkgver=1.0.5
pkgrel=5
pkgdesc="Extract color palettes from images and instantly rice any setup or config file. This package lets you blueprint your desired files, automatically populates them with colors and palettes, and saves them to your specified paths."
arch=('x86_64')
url="https://github.com/prime-run/wallrust"
license=('MIT')
depends=("imagemagick")

source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir"

  BINARY="wallrust"

  if [ ! -f "$BINARY" ]; then
    echo "Error: Could not find the binary '$BINARY'"
    find . -type f | sort
    exit 1
  fi

  install -Dm755 "$BINARY" "$pkgdir/usr/bin/$_pkgname"

  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  fi

  if [ -f "README.md" ]; then
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  fi
}
