# Maintainer: Husam Bilal <husam212 AT gmail DOT com>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.6.0"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64" "i686")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "gconf" "nss" "alsa-lib" "ttf-font")
makedepends=("gendesk")
provides=("museeks")
conflicts=("museeks" "museeks-git")
md5sums=("9552e82aab69503588724fc1c1d33d40")

_platform="x64"
if [ "$CARCH" = "ia32" ]; then
  _platform="32bit"
  md5sums=("e3adb0d0819b0a46cc025990ebc3c380")
fi

source=("https://github.com/KeitIG/museeks/releases/download/${pkgver}/museeks-linux-${_platform}.zip")

prepare() {
  gendesk -f -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc"
}

package() {
  _base_dir="${srcdir}/museeks-linux-${_platform}"

  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  install -Dm755 "${_base_dir}/museeks" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"
  install -Dm644 "${_base_dir}/"{content_shell.pak,icudtl.dat,libffmpeg.so,libnode.so,natives_blob.bin,snapshot_blob.bin,version,LICENSE} "${pkgdir}/usr/share/${_pkgname}/"

  cp -a "${_base_dir}/"{locales,resources} "${pkgdir}/usr/share/${_pkgname}/"

  ln -s "/usr/share/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${_base_dir}/resources/app/src/images/logos/museeks.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
