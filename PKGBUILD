# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=elan-bin
_pkgname=elan
_pkgname_caps=ELAN
pkgver="6.7"
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
  #'java-runtime'
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
sha256sums=('97fe0ddd3385eb500b84e9b9e44d73b95d6dbe22495cc608b176fd088917eb73'
            'd60561182a9f9a032cf4b7cb59de3af5edf70e6a168e3b19a80ec9288b272bb7')

package() {
	cd "${srcdir}/${_pkgname_caps}_${pkgver}/"
	install -d -m755 "${pkgdir}/opt/elan"
	install -d -m755 "${pkgdir}/opt/elan/bin"
	cp -r "lib" "${pkgdir}/opt/elan/"
	install -D -m755 "bin/${_pkgname_caps}_$pkgver" "${pkgdir}/opt/elan/bin/"
	install -d -m755 "${pkgdir}/usr/bin/"
	ln -s "/opt/elan/bin/${_pkgname_caps}_$pkgver" "${pkgdir}/usr/bin/elan"
	install -d -m755 "${pkgdir}/usr/share/applications/"
	install -D "${srcdir}/elan.desktop" "${pkgdir}/usr/share/applications/"
}
