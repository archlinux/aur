# Maintainer: Atharva Potdar <atharvapotdar07@gmail.com>

pkgname=koreader-nightly-bin
pkgver=2026.03_168_g4f24cb6a3
_realver=2026.03-168-g4f24cb6a3
pkgrel=1
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats (Nightly Build)"
arch=('x86_64' 'aarch64')
url="https://github.com/koreader/koreader/"
license=('AGPL3')

provides=('koreader')
conflicts=('koreader' 'koreader-bin')

depends=('sdl3' 'noto-fonts' 'ttf-droid')
options=('!strip' '!debug')

source_x86_64=("koreader-nightly-x86_64-${pkgver}.deb::https://build.koreader.rocks/download/nightly/${_realver}/koreader_${_realver}-1_amd64.deb")
source_aarch64=("koreader-nightly-aarch64-${pkgver}.deb::https://build.koreader.rocks/download/nightly/${_realver}/koreader_${_realver}-1_arm64.deb")

sha256sums_x86_64=('d3407014f1a273de224183fd6e2daf8b20e4bb19fb4ee8c2039f3e56f538dcf5')
sha256sums_aarch64=('a4655141292edd8b239187acf15f419f68a1f9b8a652411d9aaae813425472ea')

prepare() {
  rm -rf "${srcdir}/dpkgdir"
  mkdir -p "${srcdir}/dpkgdir"

  cd "${srcdir}"

  ar x "koreader-nightly-${CARCH}-${pkgver}.deb"

  DATA_ARCHIVE=$(ls data.tar.*)
  tar -xf "$DATA_ARCHIVE" -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
}
