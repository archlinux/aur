# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

_pkgname="open-video-downloader"
_srcname="youtube-dl-gui"
_srcmntr="jely2002"

pkgname="${_pkgname}-appimage"
pkgver="3.2.1"
pkgrel="2"
pkgdesc="A cross-platform GUI for youtube-dl made in Rust with Tauri and Vue + Typescript"
url="https://github.com/${_srcmntr}/${_srcname}"
arch=("x86_64")
license=("AGPL3")
options=("!strip" "!debug")
_archive="${_pkgname}-${pkgver}.AppImage"
source=(
  "${_archive}::https://github.com/${_srcmntr}/${_srcname}/releases/download/app-v${pkgver}/Open.Video.Downloader_${pkgver}_amd64.AppImage"
  "${_pkgname}.desktop"
  "${_pkgname}.png"
)
conflicts=("open-video-downloader")
provides=("open-video-downloader")

sha256sums=(
  "6c4147806427f852a2df4d9cbcf9535ab9b44d56225f8c824d0440a2eca1db97"
  "74fbe0ac6c80ebf9f7fa19dc57a999e785375838f7941adfc739bcbd0df5d91e"
  "188992cbe106d0dd6e7b9c219020118a1246c3657c828f86e463617c3d6214cb"
)

prepare() {
  sed -i -e '/^X-AppImage-/d' "${srcdir}/${_pkgname}.desktop"
}

package() {
  install -Dm755 "${srcdir}/${_archive}" \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "$srcdir/${_pkgname}.desktop" \
    "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "$srcdir/${_pkgname}.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
