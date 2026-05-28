# Maintainer: Oleh Sheremeta <me@olehsheremeta.com>
pkgname=simple-spreadsheets
pkgver=1.0
pkgrel=1
pkgdesc="Qt6 Spreadsheets processor with basic features for casual use"
arch=('x86_64')
url="https://github.com/spikest3r/Spreadsheets"
license=('GPL-3.0')

depends=('qt6-base')
makedepends=('qt6-base')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('38ab9de4aa3c89065ef1bde97fed317a64398be0173b451761b9fb20255ca600')

build() {
  cd "Spreadsheets-$pkgver"
  /usr/lib/qt6/bin/qmake PREFIX=/usr CONFIG+=release
  make -j$(nproc)
}

package() {
  cd "Spreadsheets-$pkgver"
  make INSTALL_ROOT="$pkgdir" install

  # Move binary to /usr/bin
  install -Dm755 "$pkgdir/opt/Spreadsheets/bin/Spreadsheets" \
                 "$pkgdir/usr/bin/simple-spreadsheets"

  # Remove the /opt mess
  rm -rf "$pkgdir/opt"
}
