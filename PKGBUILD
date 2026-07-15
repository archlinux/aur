# Maintainer: Atharva Potdar <atharvapotdar07@gmail.com>

pkgname=koreader-nightly-bin
pkgver=2026.03_258_g035497b50
_realver=2026.03-258-g035497b50
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

sha256sums_x86_64=('343f1eee2c0235df3345b813b2350b9c30f734597a6115dd73ee9784f0607776')
sha256sums_aarch64=('7ea48cd0e3ad10b878ecbcc34b0943c80f71869e2e78f389d8fd1f49bb205138')

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
