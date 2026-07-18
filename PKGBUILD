# Maintainer: Atharva Potdar <atharvapotdar07@gmail.com>

pkgname=koreader-nightly-bin
pkgver=2026.03_264_gb4f897421
_realver=2026.03-264-gb4f897421
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

sha256sums_x86_64=('5fc25b9550bc025699eb8cb3e4a3e455d10ad5228ce2f1d6cb071b310746118c')
sha256sums_aarch64=('6a6dfbf85538b28864b54d64e28cfc471324260d338cbf3d6bc6f82a86211c99')

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
