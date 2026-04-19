# Maintainer: Serhii Kovalyov <seryogakovalyov@gmail.com>
# Contributor: zaoqi <zaomir@outlook.com>

pkgname=koreader-bin
pkgver=2026.03
pkgrel=4
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64" 'aarch64')
url="https://github.com/koreader/koreader/"
license=('AGPL3')

depends=('sdl3' 'noto-fonts' 'ttf-droid')

source_x86_64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader_${pkgver}-1_amd64.deb")
source_aarch64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader_${pkgver}-1_arm64.deb")
sha256sums_x86_64=('3a106ede88fd22a3662b99e00a45efb9c550ab9689a2139b80436d8dd0dc41c1')
sha256sums_aarch64=('e2e96931761c202439ffd4341869fd9646d6d27b7321f507439c284c08725cb5')

prepare() {
  rm -rf "${srcdir}/dpkgdir"
  mkdir -p "${srcdir}/dpkgdir"

  cd "${srcdir}"

  DEB_FILE=$(ls *.deb)
  ar x "$DEB_FILE"

  DATA_ARCHIVE=$(ls data.tar.*)
  tar -xf "$DATA_ARCHIVE" -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
}
