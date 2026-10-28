# Maintainer: Atharva Potdar <atharvapotdar07@gmail.com>

pkgname=koreader-nightly-bin
pkgver=2026.07.2_293_gc8eb592a8
_realver=2026.07.2-293-gc8eb592a8
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
source_x86_64=("koreader-nightly-x86_64-${pkgver}.deb::https://gitlab.com/koreader/nightly-builds/-/jobs/17528306009/artifacts/raw/koreader/koreader_2026.07.2-293-gc8eb592a8-1_amd64.deb")
source_aarch64=("koreader-nightly-aarch64-${pkgver}.deb::https://gitlab.com/koreader/nightly-builds/-/jobs/17528306010/artifacts/raw/koreader/koreader_2026.07.2-293-gc8eb592a8-1_arm64.deb")

sha256sums_x86_64=('040de92eecc9bdd2e38868fb9b2f6475c25550a100282901d5a15b6b231be8b3')
sha256sums_aarch64=('4d79a8dccdb67be44469061d7b7b3dea5de2eff8a43de2be9807e2ce90051067')

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
