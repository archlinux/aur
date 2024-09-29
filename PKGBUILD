# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Felix Kauselmann <licorn at gmail dot com>

pkgname=yacreader-poppler
pkgver=9.14.2
pkgrel=2
pkgdesc="Comic reader for cross-platform reading and managing your digital comic collection, using poppler for PDF"
arch=(x86_64)
url="https://www.yacreader.com/"
license=(GPL-3.0-only)
depends=(libunarr poppler-qt6 qt6-base qt6-multimedia qt6-declarative qt6-5compat
         glibc libglvnd gcc-libs hicolor-icon-theme)
makedepends=(git qt6-tools qt6-svg)
optdepends=('qt6-imageformats: Support for extra image formats'
            'qrencode: YACReaderLibrary server info qr codes')
provides=(yacreader)
conflicts=(yacreader)
source=("git+https://github.com/YACReader/yacreader.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/yacreader"
  qmake6 CONFIG+="poppler unarr server_standalone"
  make
}

package() {
  cd "${srcdir}/yacreader"
  make INSTALL_ROOT="$pkgdir" sub-YACReader-install_subtargets sub-YACReaderLibrary-install_subtargets
}
