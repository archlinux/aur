# Maintainer: Juan Simón <play4pro at proton dot me>
# Contributor: Doron Behar <doron.behar at gmail dot com>
# Contributor: Felix Kauselmann <licorn at gmail dot com>
pkgname=yacreader-nopdf
_pkgname=yacreader
pkgver=10.0.0
pkgrel=1
pkgdesc="Comic reader for cross-platform reading and managing your digital comic collection (no PDF backend)."
arch=('i686' 'x86_64')
url="http://www.yacreader.com"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia' 'qt6-declarative' 'qt6-svg' 'qt6-imageformats'
'qt6-speech' 'qt6-5compat' 'hicolor-icon-theme')
makedepends=('qt6-tools' 'cmake' 'ninja')
provides=('yacreader' 'yacreaderlibraryserver')
conflicts=('yacreader' 'yacreaderlibraryserver' 'yacreader-bin' 'yacreader-poppler' 'yacreader-poppler-git')
install='yacreader-nopdf.install'
source=("https://github.com/YACReader/yacreader/releases/download/${pkgver}/yacreader-${pkgver}-src.tar.xz")
sha256sums=('53a36e8b6388e7b2ac90244fde510290507ea06f03a75ca42f4ca0fb96346e2e')

build() {
  cd "$srcdir/$_pkgname-$pkgver/"
  cmake -B build -DDECOMPRESSION_BACKEND=7zip -DPDF_BACKEND=no_pdf -DCMAKE_INSTALL_PREFIX=/usr -GNinja
  cmake --build build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/"
  DESTDIR="$pkgdir" cmake --install build
}
