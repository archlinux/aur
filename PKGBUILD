# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=photoflare
pkgver=1.5.7
pkgrel=1
pkgdesc='Quick, simple but powerful Cross Platform image editor.'
arch=(x86_64)
url='http://photoflare.io/'
license=(GPL3)
depends=(desktop-file-utils graphicsmagick hicolor-icon-theme qt5-base)
makedepends=(qt5-tools)
replaces=(photofiltrelx)
source=("$pkgname-$pkgver.tar.gz::https://github.com/PhotoFlare/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6888a5ae371fb74c08a89ca965c78f341c2013d91ea00dd22043a9e19229c029')

build() {
  cd "$pkgname-$pkgver"
  qmake-qt5 PREFIX=/usr PhotoFlare.pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  make -C "$pkgname-$pkgver" INSTALL_ROOT="$pkgdir/" install
}
