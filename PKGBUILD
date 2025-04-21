# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Felix Kauselmann <licorn at gmail dot com>

pkgname=yacreader-poppler
pkgver=9.15.0
pkgrel=3
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
source=("git+https://github.com/YACReader/yacreader.git#tag=${pkgver}"
        "https://github.com/FabioLolix/AUR-artifacts/raw/master/yacreader-qt6.9.0.patch"
        "https://github.com/FabioLolix/AUR-artifacts/raw/master/yacreader-qt6.9.0-02.patch")
sha256sums=('84bb54153492cb479cb5c8b54aa0c00c787fda826023da080d334a1efb5394e9'
            '825d8f5fa8dbea88b9b5db5278a08815e0438fd99c6184af4b9727e1363e717a'
            'e9263046475f3fe09e35e9f4a8e1ce71220908e6939858abae434996a5239585')

prepare() {
  cd "yacreader"
  patch -Np1 -i ../yacreader-qt6.9.0.patch
  patch -Np1 -i ../yacreader-qt6.9.0-02.patch
}

build() {
  cd "yacreader"
  qmake6 CONFIG+="poppler unarr server_standalone"
  make
}

package() {
  cd "yacreader"
  make INSTALL_ROOT="$pkgdir" sub-YACReader-install_subtargets sub-YACReaderLibrary-install_subtargets
}
