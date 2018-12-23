# Maintainer: ntruessel <nicolas+arch@ntruessel.ch>
pkgname=eiffelstudio-bin
_major=18
_minor=11
_build=102592
pkgver=${_major}.${_minor}.${_build}
pkgrel=1
pkgdesc="IDE for the Eiffel programming language (opensource edition)"
arch=("x86_64")
url="https://www.eiffel.org/downloads"
license=("GPL")
depends=("gtk2" "libxtst" "gcc")
provides=("eiffelstudio")
conflicts=("eiffelstudio")
options=("staticlibs")
source=("estudio.profile"
        "http://downloads.sourceforge.net/project/eiffelstudio/EiffelStudio%20${_major}.${_minor}/Build_${_build}/Eiffel_${_major}.${_minor}_gpl_${_build}-linux-x86-64.tar.bz2")
sha256sums=('3b5f56cf15ad160284ba49db0928b2fff5132cfbc56f7c3c1ac7289ee5bc93fc'
            'aa0a77ee74f3d6a490e24202ba2311260678e2800b18e6e685bd430fb3ea8c19')

prepare() {
	# remove windows files and folders
	find "${srcdir}/Eiffel_${_major}.${_minor}" -name "msc*" -type d -exec rm -rf {} +
	find "${srcdir}/Eiffel_${_major}.${_minor}" -name "*.dll" -type f -exec rm -rf {} +
}

package() {
	install -dm755 "${pkgdir}/opt"
	cp -a "${srcdir}/Eiffel_${_major}.${_minor}/" "${pkgdir}/opt/estudio"

	sed -i 's/@ARCH@/linux-x86-64/g' "${srcdir}/estudio.profile"

	install -Dm755 "${srcdir}/estudio.profile" "${pkgdir}/etc/profile.d/estudio.sh"
}
