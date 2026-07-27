# Maintainer: Serhii Kovalyov <seryogakovalyov@gmail.com>
# Contributor: zaoqi <zaomir@outlook.com>

pkgname=koreader-bin
pkgver=2026.07
pkgrel=1
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64" 'aarch64')
url="https://github.com/koreader/koreader/"
license=('AGPL3')

depends=('sdl3' 'noto-fonts' 'ttf-droid')

source_x86_64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader_${pkgver}-1_amd64.deb")
source_aarch64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader_${pkgver}-1_arm64.deb")
sha256sums_x86_64=('19dd45c274e39daee4daf9508d3b24319caff74924aa69076ba14eb3a881d8a3')
sha256sums_aarch64=('46d54085455e0b37cf3be1bfdf056f3c9b133ee80c1e0a4ad0a3eb6226c9f3ae')

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
