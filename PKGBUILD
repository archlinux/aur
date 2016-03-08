# Maintainer: ntruessel <ntruessel@njsm.de>
pkgname=eiffelstudio-bin
_major=15
_minor=12
_build=98497
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
sha256sums_x86_64=('df4400a1a8cbe541aee6035aa69ba2f2fc85afe142bc2db4f69520e86d553c35')
source_i686=("http://downloads.sourceforge.net/project/eiffelstudio/EiffelStudio%20${_major}.${_minor}/Build_${_build}/Eiffel_${_major}.${_minor}_gpl_${_build}-linux-x86.tar.bz2")
sha256sums_i686=('73c370de7f9ec2b97e40ff5772ed7e1a2f260f9777c7b6732214e307283364ec')

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
