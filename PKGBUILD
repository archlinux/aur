# Maintainer: Lakshmanan P <lakshmanoni1234@gmail.com>
pkgname=microcks-cli
pkgver=0.5.7
pkgrel=1
epoch=
pkgdesc="Microcks CLI for API Mocking and Testing"
arch=('x86_64' 'aarch64')
url="https://github.com/microcks/microcks-cli"
license=('Apache')
depends=()
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/microcks/microcks-cli#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  export CGO_ENABLED=0
  export GOOS=linux

  if [[ $(uname -m) == "aarch64" ]]; then
    GOARCH="arm64"
  else
    GOARCH="amd64"
  fi

  go build -ldflags="-s -w" -o "$pkgname"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"  # Install the binary

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" # Move license
}
