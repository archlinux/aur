# Maintainer: Oleh Sheremeta <me@olehsheremeta.com>
pkgname=simple-spreadsheets
pkgver=2.0
pkgrel=1
pkgdesc="Qt6 Spreadsheets processor with basic features for casual use"
arch=('x86_64')
url="https://github.com/spikest3r/Spreadsheets"
license=('GPL-3.0')

depends=('qt6-base')
makedepends=('qt6-base' 'git')

source=("$pkgname-$pkgver::git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  /usr/lib/qt6/bin/qmake PREFIX=/usr CONFIG+=release
  make -j$(nproc)
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install

  # Move binary to /usr/bin
  install -Dm755 "$pkgdir/opt/Spreadsheets/bin/Spreadsheets" \
                 "$pkgdir/usr/bin/simple-spreadsheets"

  # Remove the /opt mess
  rm -rf "$pkgdir/opt"
}
