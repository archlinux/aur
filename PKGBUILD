# Maintainer: Atharva Potdar <atharvapotdar07@gmail.com>

pkgname=koreader-nightly-bin
pkgver=2026.07.2_185_gdcf6e3b42
_realver=2026.07.2-185-gdcf6e3b42
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgrel=1
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats (Nightly Build)"
arch=('x86_64' 'aarch64')
url="https://github.com/koreader/koreader/"
license=('AGPL3')

provides=('koreader')
conflicts=('koreader' 'koreader-bin')

depends=('sdl3' 'noto-fonts' 'ttf-droid')
options=('!strip' '!debug')

# These lines are fully rewritten by CI on every run.
source_x86_64=("koreader-nightly-x86_64-${pkgver}.deb::https://gitlab.com/koreader/nightly-builds/-/jobs/16671954485/artifacts/raw/koreader/koreader_2026.07.2-185-gdcf6e3b42-1_amd64.deb")
source_aarch64=("koreader-nightly-aarch64-${pkgver}.deb::https://gitlab.com/koreader/nightly-builds/-/jobs/16671954486/artifacts/raw/koreader/koreader_2026.07.2-185-gdcf6e3b42-1_arm64.deb")

sha256sums_x86_64=('ec94b75ff4e04eb19c629893de45271667f988f7791268992286b0e4106003ee')
sha256sums_aarch64=('86cba2d8d3a81e6e97c31f6f3b30efbbe593e8a230beb2dadf2a4cd3e98b8c70')

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
