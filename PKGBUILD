# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=elan-simple-bin
_name=elan-simple
_upstream_name_caps="Simple-ELAN"
_upstream_name_low="simple-elan"
pkgver="1.5"
pkgrel=1
pkgdesc="A video and audio annotation tool (simplified version)"
arch=('x86_64')
url="https://archive.mpi.nl/tla/elan"
provides=('elan-simple')
conflicts=('elan-simple')
depends=(
  'alsa-lib'
  'freetype2'
  'glibc'
  'gcc-libs'
  'java-runtime'
  'libx11'
  'libxext'
  'libxi'
  'libxrender'
  'libxtst'
  'libxcb'
  'zlib'
)
license=('GPL-3.0-or-later')
source=("https://www.mpi.nl/tools/elan/simple/${_upstream_name_caps}_${pkgver//\./\-}_linux.tar.gz"
        "${_name}.desktop")
sha256sums=('31bb4e24810bbe1960775562d5904a1c40fed25d667fc2cee5b03c050188d4a6'
            '8b3ef7210dd7d6e3748c6fedda3da0fa5ca92b82bfac5e7dc603dd87e75b133f')

package() {
	cd "${srcdir}/${_upstream_name_caps}_${pkgver}"
	install -d -m755 "${pkgdir}/opt/$_name"
	cp -r "bin" "${pkgdir}/opt/${_name}/"
	cp -r "lib" "${pkgdir}/opt/${_name}/"
	chmod +x "${pkgdir}/opt/${_name}/bin/${_upstream_name_caps}_${pkgver}"
	install -d -m755 "${pkgdir}/usr/bin/"
	ln -s "/opt/$_name/bin/${_upstream_name_caps}_${pkgver}" "${pkgdir}/usr/bin/$_name"
	install -d -m755 "${pkgdir}/usr/share/applications/"
  sed -i 's/VERSIONSTRINGHERE/'"$pkgver"'/' "${srcdir}/${_name}.desktop"
	install -D "${srcdir}/${_name}.desktop" "${pkgdir}/usr/share/applications/"
  install -d -m755 "${pkgdir}/usr/share/pixmaps"
  install -D "${srcdir}/${_upstream_name_caps}_${pkgver}/lib/${_upstream_name_caps}_${pkgver}.png" \
    "${pkgdir}/usr/share/pixmaps/${_name}.png"
}
