# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=elan-simple-bin
_pkgname=elan-simple
_name_caps="Simple-ELAN"
_name_low="simple-elan"
pkgver="1.4"
pkgrel=3
pkgdesc="A video and audio annotation tool (simplified version)"
arch=('x86_64')
url="https://archive.mpi.nl/tla/elan"
provides=('elan-simple')
conflicts=('elan-simple')
depends=(
  'java-runtime'
  'alsa-lib'
  'libxtst'
  'libxext'
  'libxi'
  'libxrender'
  'zlib'
  'libx11'
  'freetype2'
  'glibc'
)
license=('GPL3' 'apache')
source=("https://www.mpi.nl/tools/elan/simple/${_name_caps}_${pkgver//\./\-}_linux.tar.gz"
        "${_pkgname}.desktop")
sha256sums=('e8e29fd10373e5d7d2be0aba4e36196b47f1382d289561c6ec0704181c718a9a'
            '00b0998588a437f60d6c86ac510778b0311a1f0c2becd886219e06ea33a71d89')

package() {
	cd "${srcdir}/${_name_caps}_${pkgver//\./\-}/opt"
	install -d -m755 "${pkgdir}/opt/$_pkgname"
	cp -r "${_name_low}-${pkgver//\./\-}/bin" "${pkgdir}/opt/${_pkgname}/"
	cp -r "${_name_low}-${pkgver//\./\-}/lib" "${pkgdir}/opt/${_pkgname}/"
	chmod +x "${pkgdir}/opt/${_pkgname}/bin/$_name_caps"
	install -d -m755 "${pkgdir}/usr/bin/"
	ln -s "/opt/$_pkgname/bin/$_name_caps" "${pkgdir}/usr/bin/$_pkgname"
	install -d -m755 "${pkgdir}/usr/share/applications/"
	install -D "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
