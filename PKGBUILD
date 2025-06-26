# Maintainer: Dimitrios Desyllas <pcmagas@disroot.org>
pkgname='mkdotenv'
pkgver=0.3.3
pkgrel=1
pkgdesc="Lightweight and efficient tool for managing your .env files."
arch=('x86_64')
url="https://github.com/pc-magas/mkdotenv"
license=('GPL-3')
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/pc-magas/mkdotenv/releases/download/v$pkgver/mkdotenv-$pkgver.tar.gz")
sha256sums=('ead57a3af32d610abc663bae2a2008985d373de1c5606db90b8fff8f3ebe1ef6')

prepare() {
  curl -LO https://go.dev/dl/go1.24.3.linux-amd64.tar.gz
  tar -C "$srcdir" -xzf go1.24.3.linux-amd64.tar.gz
  rm go1.24.3.linux-amd64.tar.gz
}

build() {
  export PATH="$srcdir/go/bin:$PATH"
  make VERSION="${pkgver}"
}

package() {
  make install \
    DESTDIR="${pkgdir}" \
    INSTALL_BIN_DIR="/usr/bin" \
    INSTALL_MAN_DIR="/usr/share/man/man1"
}
