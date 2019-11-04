# Maintainer: Dan McCurry <dan.mc at protonmail dot com>
_version=October2019
pkgname=fullprof-suite
pkgver=2019.10.21
pkgrel=1
pkgdesc="Crystallographic tools for Rietveld, profile matching & integrated intensity refinements of X-Ray and/or neutron data."
arch=('x86_64')
url="https://www.ill.eu/sites/fullprof"
license=('custom')
groups=('science')
depends=('gcc-libs' 'libpng12')
# optdepends=('xterm: Needed to launch some programs from GUI')
provides=('fullprof')
conflicts=('fullprof')
#install=${pkgname}.install

# You will need to download the .tgz file from the webpage directly:
# https://www.ill.eu/sites/fullprof/php/downloads.html

source=("file://FullProf_Suite_${_version}_Linux64.tgz"
	"fullprof-suite.sh")
md5sums=('75203ccd14a79954c61c6bf9178954cc'
         'fe1d636103b65f8e6455fa82ff96cc64')
PKGEXT=.pkg.tar

prepare() {
	mkdir -p "${srcdir}/${pkgname}"

	msg2 "Extracting FullProf Suite..."
	tar -xzf "${srcdir}/FullProf_Suite_${_version}_Linux64.tgz" -C "${srcdir}/${pkgname}/"
}	

package() {
	mkdir -p "${pkgdir}/opt/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "${pkgdir}/etc/profile.d"

	cp -R "${srcdir}/${pkgname}/." "${pkgdir}/opt/${pkgname}/"
	ln -s "/opt/${pkgname}/Docs/Readme_Fp_Suite.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/README"

	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
