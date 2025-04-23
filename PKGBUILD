# Maintainer: prime-run <prime-run@github.com>
# Contributor: jrodriigues <jrodriigues@github.com>

pkgname=togo
pkgver=1.0.2
pkgrel=1
pkgdesc="A fast, simple and beautifull termianl-based to-do manager with zero dependencies"
arch=('x86_64')
url="https://github.com/prime-run/togo"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"
  find . -type f -name "togo" -o -name "$pkgname" -o -name "*" | sort
}
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "$srcdir"
  
  BINARY="togo-${pkgver}-linux-amd64"
  
  if [ ! -f "$BINARY" ]; then
    echo "Error: Could not find the binary '$BINARY'"
    find . -type f | sort
    exit 1
  fi
  
  install -Dm755 "$BINARY" "$pkgdir/usr/bin/$pkgname"
  
  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  
  if [ -f "README.md" ]; then
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
