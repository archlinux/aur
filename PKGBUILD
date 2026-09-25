# Maintainer: Atharva Potdar <atharvapotdar07@gmail.com>

pkgname=koreader-nightly-bin
pkgver=2026.07.2_187_gd9cd2788e
_realver=2026.07.2-187-gd9cd2788e
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
source_x86_64=("koreader-nightly-x86_64-${pkgver}.deb::https://gitlab.com/koreader/nightly-builds/-/jobs/16726855985/artifacts/raw/koreader/koreader_2026.07.2-187-gd9cd2788e-1_amd64.deb")
source_aarch64=("koreader-nightly-aarch64-${pkgver}.deb::https://gitlab.com/koreader/nightly-builds/-/jobs/16726855986/artifacts/raw/koreader/koreader_2026.07.2-187-gd9cd2788e-1_arm64.deb")

sha256sums_x86_64=('3b74b3dce77f6845b40220e2db79ac0daeeaf1fd2fe71ae513599f82d9e37fa5')
sha256sums_aarch64=('ccfa045810b53401c28ddb888a9c67251910b9c72acfaa4d4f4de6152bad776a')

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
