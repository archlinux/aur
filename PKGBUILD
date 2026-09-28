# Maintainer: Atharva Potdar <atharvapotdar07@gmail.com>

pkgname=koreader-nightly-bin
pkgver=2026.07.2_194_g71b664c60
_realver=2026.07.2-194-g71b664c60
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
source_x86_64=("koreader-nightly-x86_64-${pkgver}.deb::https://gitlab.com/koreader/nightly-builds/-/jobs/16770749212/artifacts/raw/koreader/koreader_2026.07.2-194-g71b664c60-1_amd64.deb")
source_aarch64=("koreader-nightly-aarch64-${pkgver}.deb::https://gitlab.com/koreader/nightly-builds/-/jobs/16770749213/artifacts/raw/koreader/koreader_2026.07.2-194-g71b664c60-1_arm64.deb")

sha256sums_x86_64=('b744554c28e575c6a01d1742b8f72cb6df66ecee39ad339945c7e8eb89181a7c')
sha256sums_aarch64=('d309367ba8298fabd2d6d9c81cce5daebc2963f8c1826cc3376d5f03da76ca11')

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
