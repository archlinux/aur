# Maintainer: Kye Morton <pryre.dev@outlook.com>
pkgname=qgroundcontrol-bin
pkgver=4.0.1
pkgrel=1
pkgdesc="Ground control for unmanned vehicles."
arch=('x86_64')
url="http://qgroundcontrol.org/"
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

source=('qgroundcontrol-'${pkgver}'-'${pkgrel}'.tar.bz2::https://github.com/mavlink/qgroundcontrol/releases/download/v'${pkgver}'/qgroundcontrol.tar.bz2')

sha256sums=('d9a1ed67213a74b2569d32f4002fa9fa7e67757a5ed328cd3cac165bc1d1df9a')

build() {
	echo "[Desktop Entry]
Type=Application
Name=QGroundControl
Comment=Ground control for unmanned vehicles
Path=/opt/${pkgname}/
Exec=/usr/bin/${pkgname}
Icon=/opt/${pkgname}/qgroundcontrol.png
Terminal=false
Categories=Qt;Utility;" > "$srcdir/${pkgname}.desktop"
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"
  cp -R "$srcdir/${pkgname%-bin}" "${pkgdir}/opt/${pkgname}"
  cp "$srcdir/${pkgname}.desktop" "${pkgdir}/opt/${pkgname}"

  ln -s "/opt/${pkgname}/qgroundcontrol-start.sh" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/opt/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
