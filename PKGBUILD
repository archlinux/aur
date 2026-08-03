# Maintainer: Serhii Kovalyov <seryogakovalyov@gmail.com>
# Contributor: zaoqi <zaomir@outlook.com>

pkgname=koreader-bin
pkgver=2026.07.1
pkgrel=2
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64" 'aarch64')
url="https://github.com/koreader/koreader/"
license=('AGPL3')

depends=('sdl3' 'noto-fonts' 'ttf-droid')

source_x86_64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader_${pkgver}-1_amd64.deb")
source_aarch64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader_${pkgver}-1_arm64.deb")
sha256sums_x86_64=('0969a77c2ec3cb89d57fb762c11bec3af135d96fe0904db6df9878f47ab47f89')
sha256sums_aarch64=('b30c0d726aae3239cedf5a453642996ea53c2b1ed1b70ab679b4f5d972bccaf4')

prepare() {
  local deb_arch

  case "${CARCH}" in
    x86_64) deb_arch=amd64 ;;
    aarch64) deb_arch=arm64 ;;
  esac

  rm -rf "${srcdir}/ardir" "${srcdir}/dpkgdir"
  mkdir -p "${srcdir}/ardir" "${srcdir}/dpkgdir"

  cd "${srcdir}/ardir"
  ar x "${srcdir}/koreader_${pkgver}-1_${deb_arch}.deb"
  tar -xf data.tar.* -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
}
