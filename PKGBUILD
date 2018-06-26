# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=photoflare
pkgver=1.5.4
pkgrel=1
pkgdesc='Quick, simple but powerful Cross Platform image editor.'
arch=(x86_64)
url='http://photoflare.io/'
license=(GPL3)
depends=(desktop-file-utils graphicsmagick qt5-base)
makedepends=(qt5-tools)
replaces=(photofiltrelx)
source=("$pkgname-$pkgver.tar.gz::https://github.com/PhotoFlare/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('65f1fbd726e4c1d7fab8a10f6f091fec9102e857d51db7223be25f297b11cea0')

prepare() {
  sed -i '1 s/^/#/' "$pkgname-$pkgver"/PhotoFlare.pro
}

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
