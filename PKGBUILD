# Maintainer: Dimitrios Desyllas <pcmagas@disroot.org>
pkgname='mkdotenv'
pkgver=1.0.0
pkgrel=1
pkgdesc="Populate .env files from secrets."
arch=('x86_64')
url="https://github.com/pc-magas/mkdotenv"
license=('GPL-3')
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/pc-magas/mkdotenv/releases/download/v$pkgver/mkdotenv-$pkgver.tar.gz")

prepare() {
  curl -LO https://go.dev/dl/go1.25.3.linux-amd64.tar.gz
  tar -C "$srcdir" -xzf go1.25.3.linux-amd64.tar.gz
  rm go1.25.3.linux-amd64.tar.gz
}

build() {
  export PATH="$srcdir/go/bin:$PATH"
  make bin VERSION="${pkgver}"
}

package() {
  make install \
    DESTDIR="${pkgdir}" \
    INSTALL_BIN_DIR="/usr/bin" \
    INSTALL_MAN_DIR="/usr/share/man/man1"
}
sha256sums=('7e7b6d670372dbcbe9eddf3b4eef4679d8c55c234ffd898a9b32894a2b0400d0')
