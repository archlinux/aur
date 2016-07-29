# Maintainer: ntruessel <ntruessel@njsm.de>
pkgname=eiffelstudio-bin
_major=16
_minor=05
_build=98969
pkgver=${_major}.${_minor}.${_build}
pkgrel=1
pkgdesc="IDE for the Eiffel programming language (opensource edition)"
arch=("i686" "x86_64")
url="https://www.eiffel.com/eiffelstudio/"
license=("GPL")
depends=("gtk2" "libxtst" "gcc")
provides=("eiffelstudio")
conflicts=("eiffelstudio")
options=("staticlibs")
source=("estudio.profile")
md5sums=("babf4e2957285cad811ae51e03e5cbd9")
sha256sums=('3b5f56cf15ad160284ba49db0928b2fff5132cfbc56f7c3c1ac7289ee5bc93fc')
source_x86_64=("http://downloads.sourceforge.net/project/eiffelstudio/EiffelStudio%20${_major}.${_minor}/Build_${_build}/Eiffel_${_major}.${_minor}_gpl_${_build}-linux-x86-64.tar.bz2")
sha256sums_x86_64=('26e57c9f6ae2003f717b126cb7e44a9bd6e3f8d4ee48c50eee81918d8af353e6')
source_i686=("http://downloads.sourceforge.net/project/eiffelstudio/EiffelStudio%20${_major}.${_minor}/Build_${_build}/Eiffel_${_major}.${_minor}_gpl_${_build}-linux-x86.tar.bz2")
sha256sums_i686=('223e4fe844cc5b31e1b50325b94fd879643c9ba2f6ca1fc1648d33a790b53b46')

prepare() {
	# remove windows files and folders
	find "${srcdir}/Eiffel_${_major}.${_minor}" -name "msc" -type d -exec rm -rf {} +
}

package() {
	install -dm755 "${pkgdir}/opt"
	cp -a "${srcdir}/Eiffel_${_major}.${_minor}/" "${pkgdir}/opt/estudio"

	if [[ "$CARCH" == "x86_64" ]]; then
		sed -i 's/@ARCH@/linux-x86-64/g' "${srcdir}/estudio.profile"
	else
		sed -i 's/@ARCH@/linux-x86/g' "${srcdir}/estudio.profile"
	fi

	install -Dm755 "${srcdir}/estudio.profile" "${pkgdir}/etc/profile.d/estudio.sh"
}
