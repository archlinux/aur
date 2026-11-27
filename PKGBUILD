# Maintainer: Atharva Potdar <atharvapotdar07@gmail.com>

pkgname=koreader-nightly-bin
pkgver=2026.07.2_359_gb32d91a7c
_realver=2026.07.2-359-gb32d91a7c
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
source_x86_64=("koreader-nightly-x86_64-${pkgver}.deb::https://gitlab.com/koreader/nightly-builds/-/jobs/18419402050/artifacts/raw/koreader/koreader_2026.07.2-359-gb32d91a7c-1_amd64.deb")
source_aarch64=("koreader-nightly-aarch64-${pkgver}.deb::https://gitlab.com/koreader/nightly-builds/-/jobs/18419402051/artifacts/raw/koreader/koreader_2026.07.2-359-gb32d91a7c-1_arm64.deb")

sha256sums_x86_64=('ade54eae6d3341f91377cbf24f299ec76c7fcc6476ee5b8e6df7cda21913651a')
sha256sums_aarch64=('aa2cd2e45f8eec21cb42676afd1f532c1ac16d04456d45873ca7b04066cc1e95')

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
