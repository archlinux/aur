# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

_pkgname="open-video-downloader"
_srcname="youtube-dl-gui"
_srcmntr="jely2002"

pkgname="${_pkgname}-appimage"
pkgver="3.2.0"
pkgrel="1"
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
  "dffee4cfef50e8edb9be4136d5650b123e49b8a1ffd959ff3d2c42502fc391e3"
  "217d02211a51853d920e53558cd9cbd7a753ba9f2036ddaa0ec4e00a77351b6c"
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
