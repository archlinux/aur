# Maintainer: Mark Collins <tera_1225 [at] hotmail [ðot] com>
pkgname=elan-bin
_pkgname=elan
_pkgname_caps=ELAN
pkgver="7.0"
pkgrel=1
pkgdesc="A video and audio annotation tool"
arch=('x86_64')
url="https://tla.mpi.nl/tools/tla-tools/elan/"
provides=('elan')
conflicts=('elan')
depends=(
  'alsa-lib'
  'ffmpeg'
  'freetype2'
  'gcc-libs'
  'glibc'
  'libx11'
  'libxcb'
  'libxext'
  'libxi'
  'libxrender'
  'libxtst'
  'zlib'
)
license=('GPL-3.0-or-later')
source=("https://www.mpi.nl/tools/${_pkgname}/${_pkgname_caps}_${pkgver//\./\-}_linux.tar.gz"
        "${_pkgname}.desktop")
sha256sums=('e04d41a06c5abddafeb846421f538062c5c422b7845accfe8081e4c0cc7ddf72'
            '918720769c986b0183b563596da1a8a9da039eb1196132b224b3b110d8233394')

package() {
	cd "${srcdir}/${_pkgname_caps}_${pkgver}/"
	install -d -m755 "${pkgdir}/opt/${_pkgname}"
	install -d -m755 "${pkgdir}/opt/${_pkgname}/bin"
	cp -r "lib" "${pkgdir}/opt/${_pkgname}/"
	install -D -m755 "bin/${_pkgname_caps}_$pkgver" "${pkgdir}/opt/${_pkgname}/bin/"
	install -d -m755 "${pkgdir}/usr/bin/"
	ln -s "/opt/${_pkgname}/bin/${_pkgname_caps}_$pkgver" "${pkgdir}/usr/bin/${_pkgname}"
	install -d -m755 "${pkgdir}/usr/share/applications/"
  sed -i 's/VERSIONSTRINGHERE/'"$pkgver"'/' "${srcdir}/${_pkgname}.desktop"
	install -D "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  install -d -m755 "${pkgdir}/usr/share/pixmaps"
  install -D "${srcdir}/${_pkgname_caps}_${pkgver}/lib/${_pkgname_caps}_${pkgver}.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
