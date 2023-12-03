# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=elan-bin
_pkgname=elan
_pkgname_caps=ELAN
pkgver="6.6"
pkgrel=2
pkgdesc="A video and audio annotation tool"
arch=('x86_64')
url="https://tla.mpi.nl/tools/tla-tools/elan/"
provides=('elan')
conflicts=('elan')
depends=(
  'java-runtime'
  'zlib'
  'gcc-libs'
  'glibc'
)
license=('GPL3' 'apache')
source=("https://www.mpi.nl/tools/${_pkgname}/${_pkgname_caps}_${pkgver//\./\-}_linux.tar.gz"
        "elan_${pkgver}.desktop")
sha256sums=('d0bcde6c7971c2ac051abebe4268fa6850247d45f15c8ad9df8650e6c86a2497'
            '60405b3035a7bec6d83e1445ea7e9010da221a360c86e6cdf471c429d6831109')

package() {
	cd "${srcdir}/${_pkgname_caps}_${pkgver}/"
	install -d -m755 "${pkgdir}/opt/elan"
	install -d -m755 "${pkgdir}/opt/elan/bin"
	cp -r "lib" "${pkgdir}/opt/elan/"
	install -D -m755 "bin/${_pkgname_caps}_$pkgver" "${pkgdir}/opt/elan/bin/"
	install -d -m755 "${pkgdir}/usr/bin/"
	ln -s "/opt/elan/bin/${_pkgname_caps}_$pkgver" "${pkgdir}/usr/bin/elan"
	install -d -m755 "${pkgdir}/usr/share/applications/"
	install -D "${srcdir}/elan_${pkgver}.desktop" "${pkgdir}/usr/share/applications/"
}
