# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=elan-bin
_pkgname=elan
_pkgname_caps=ELAN
pkgver="6.9"
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
        "elan.desktop")
sha256sums=('d2608b5853e2b42881c9439a1fe8d15683282ea0183dffff11fc15d789b112c7'
            '918720769c986b0183b563596da1a8a9da039eb1196132b224b3b110d8233394')

package() {
	cd "${srcdir}/${_pkgname_caps}_${pkgver}/"
	install -d -m755 "${pkgdir}/opt/elan"
	install -d -m755 "${pkgdir}/opt/elan/bin"
	cp -r "lib" "${pkgdir}/opt/elan/"
	install -D -m755 "bin/${_pkgname_caps}_$pkgver" "${pkgdir}/opt/elan/bin/"
	install -d -m755 "${pkgdir}/usr/bin/"
	ln -s "/opt/elan/bin/${_pkgname_caps}_$pkgver" "${pkgdir}/usr/bin/elan"
	install -d -m755 "${pkgdir}/usr/share/applications/"
  sed -i 's/VERSIONSTRINGHERE/'"$pkgver"'/' "${srcdir}/elan.desktop"
	install -D "${srcdir}/elan.desktop" "${pkgdir}/usr/share/applications/"
}
