# Maintainer: Atharva Potdar <atharvapotdar07@gmail.com>

pkgname=koreader-nightly-bin
pkgver=2026.07.2_66_g2d505d1ea
_realver=2026.07.2-66-g2d505d1ea
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

sha256sums_x86_64=('35b19a853d143f4529cf1a5cf5d5f78589a85ef547ae3794e387d59e9aba478a')
sha256sums_aarch64=('134f9da60384e2dadfccdd6b9c5077cbcc8f4a2e1cafd82580db83234470e50a')

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
