# Maintainer: Pablo Romano <promano7@hotmail.com>
# Contributor: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Kewl <lfxm@bmup.fv.psh (rot1)>
# Contributor: Bjoern Franke <bjo@nord-west.org>
_watch=("https://www.xnview.com/en/xnconvert" ">Version (\d[\d.]*\d+)\b")

pkgname=xnconvert
pkgver=1.118.0
pkgrel=1
pkgdesc='Batch image converter and resizer'
arch=('x86_64')
url='https://www.xnview.com/en/xnconvert/'
license=('LicenseRef-XnSoft-EULA')
depends=(
  'coreutils' 'dbus' 'fontconfig' 'freetype2' 'glib2' 'glibc'
  'hicolor-icon-theme' 'krb5' 'libdrm' 'libgcc' 'libglvnd' 'libstdc++'
  'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'wayland'
  'xcb-util' 'xcb-util-cursor' 'xcb-util-image' 'xcb-util-keysyms'
  'xcb-util-renderutil' 'xcb-util-wm' 'zlib' 'zstd'
)
optdepends=('gtk3: GTK desktop integration')
options=('!strip' '!debug')
source=(
  'xnconvert.desktop'
  "https://download.xnview.com/versions/XnConvert/XnConvert-${pkgver}-linux-x64.tgz"
)
sha256sums=(
  '9fcbb276b849630afb8b4c1b5d6fb8a5abfced17e25ee8ae5372c0f0f7f367c9'
  'b1678a13bb1dc232be5b118b79fe11dda887e0431294269e3a0fde2ed3ea377f'
)

package() {
  install -d "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
  cp -a --no-preserve=ownership "${srcdir}/XnConvert/." "${pkgdir}/opt/${pkgname}/"
  rm "${pkgdir}/opt/${pkgname}/XnConvert.desktop"
  ln -s "/opt/${pkgname}/xnconvert.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/xnconvert.desktop" "${pkgdir}/usr/share/applications/xnconvert.desktop"
  install -Dm644 "${srcdir}/XnConvert/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/XnConvert/xnconvert.png" \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
}
