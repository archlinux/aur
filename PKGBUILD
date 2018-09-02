# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=photoflare
pkgver=1.5.5
pkgrel=1
pkgdesc='Quick, simple but powerful Cross Platform image editor.'
arch=(x86_64)
url='http://photoflare.io/'
license=(GPL3)
depends=(desktop-file-utils graphicsmagick hicolor-icon-theme qt5-base)
makedepends=(qt5-tools)
replaces=(photofiltrelx)
source=("$pkgname-$pkgver.tar.gz::https://github.com/PhotoFlare/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1e47725fb619cfacbb7b6a17fb76cf8b7191b323261c2f07102bfffc483a49d0')

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
