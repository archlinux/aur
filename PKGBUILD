# Maintainer: Charles Villard <charlesvillard10@gmail.com>
# Contributor: Kye Morton <pryre.dev@outlook.com>
pkgname=qgroundcontrol-appimage
pkgver=4.1.4
pkgrel=1
pkgdesc="Ground control for unmanned vehicles."
arch=('x86_64')
url="https://github.com/mavlink/qgroundcontrol"
license=('GPL3')

depends=( 'bzip2'
		  'dbus'
		  'flac'
		  'gst-plugins-base-libs'
		  'libasyncns'
		  'libffi'
		  'libgcrypt'
		  'libgpg-error'
		  'libogg'
		  'libsndfile'
		  'libsystemd'
		  'libunwind'
		  'libx11'
		  'libxau'
		  'libxcb'
		  'libxdmcp'
		  'libxext'
		  'lz4'
		  'orc'
		  'pcre'
		  'sdl2'
		  'xz'
		  'zlib'
		  'icu' )
options=(!strip)

source=("${pkgname}-${pkgver}.AppImage::https://github.com/mavlink/qgroundcontrol/releases/download/v${pkgver}/QGroundControl.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")

sha256sums=('2defe2a037c04d8a85489f4057cde0fc5a13fce1520f8b3885c5d75ed30f4bcb')

build() {
	echo "[Desktop Entry]
Type=Application
Name=QGroundControl
Comment=Ground control for unmanned vehicles
Path=/opt/${pkgname}/
Exec=/usr/bin/${pkgname}
Terminal=false
Categories=Qt;Utility;" > "$srcdir/${pkgname}.desktop"
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"

  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  cp "$srcdir/${pkgname}.desktop" "${pkgdir}/opt/${pkgname}/"

  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/opt/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
