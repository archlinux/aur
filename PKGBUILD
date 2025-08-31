# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: pikakolendo <pikakolendo02 at g-m-a-i-1 dot c0m>

_pkgname='appimagetool'
pkgname="${_pkgname}-bin"
pkgver=r67.aa0b7dc
pkgrel=1
pkgdesc='Package desktop applications as AppImages'
arch=('x86_64' 'armv7h' 'aarch64' 'i686')
url='https://github.com/AppImage/appimagetool'
license=('MIT')
depends=('libappimage')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
noextract=("${_pkgname}-i686.AppImage"
          "${_pkgname}-x86_64.AppImage"
          "${_pkgname}-armhf.AppImage"
          "${_pkgname}-aarch64.AppImage")

source=("git+${url}.git")
source_i686=("${_pkgname}-i686.AppImage::${url}/releases/download/continuous/${_pkgname}-i686.AppImage")
source_x86_64=("${_pkgname}-x86_64.AppImage::${url}/releases/download/continuous/${_pkgname}-x86_64.AppImage")
source_armv7h=("${_pkgname}-armv7h.AppImage::${url}/releases/download/continuous/${_pkgname}-armhf.AppImage")
source_aarch64=("${_pkgname}-aarch64.AppImage::${url}/releases/download/continuous/${_pkgname}-aarch64.AppImage")

sha256sums=('SKIP')
sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --abbrev=7 --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  chmod a+x "${_pkgname}-${CARCH}.AppImage"
  ./"${_pkgname}-${CARCH}.AppImage" --appimage-extract
}

package(){
  depends+=('zsync' 'desktop-file-utils' 'squashfs-tools')

  install -Dvm755 "squashfs-root/usr/bin/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dvm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

