# Maintainer: ntruessel <ntruessel@njsm.de>
pkgname=eiffelstudio-bin
_major=15
_minor=08
_build=97862
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
source_x86_64=("http://downloads.sourceforge.net/project/eiffelstudio/EiffelStudio%20${_major}.${_minor}/Build_${_build}/Eiffel_${_major}.${_minor}_gpl_${_build}-linux-x86-64.tar.bz2")
md5sums_x86_64=("aa943dd8836d55826efe4ff4729e0c88")
source_i686=("http://downloads.sourceforge.net/project/eiffelstudio/EiffelStudio%20${_major}.${_minor}/Build_${_build}/Eiffel_${_major}.${_minor}_gpl_${_build}-linux-x86.tar.bz2")
md5sums_i686=("7e1971ca94f312886880d2f8aa24066d")

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
