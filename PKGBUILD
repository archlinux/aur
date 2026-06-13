# Maintainer: Atharva Potdar <atharvapotdar07@gmail.com>

pkgname=koreader-nightly-bin
pkgver=2026.03_186_g5598a6ee4
_realver=2026.03-186-g5598a6ee4
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

sha256sums_x86_64=('7f97c6c7fbfbedc66db315aa2a92e37568b072bc177fee42f06f8378bbe44105')
sha256sums_aarch64=('0a49d5a15273e5db37b950c40f5219d53e5416d3e778cd262497f5bbdaf39fd3')

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
