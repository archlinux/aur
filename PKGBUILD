# Maintainer: ntruessel <ntruessel@njsm.de>
pkgname=eiffelstudio-bin
_major=17
_minor=05
_build=100416
pkgver=${_major}.${_minor}.${_build}
pkgrel=1
pkgdesc="IDE for the Eiffel programming language (opensource edition)"
arch=("i686" "x86_64")
url="https://www.eiffel.org/downloads"
license=("GPL")
depends=("gtk2" "libxtst" "gcc")
provides=("eiffelstudio")
conflicts=("eiffelstudio")
options=("staticlibs")
source=("estudio.profile")
sha256sums=('3b5f56cf15ad160284ba49db0928b2fff5132cfbc56f7c3c1ac7289ee5bc93fc')
source_x86_64=("http://downloads.sourceforge.net/project/eiffelstudio/EiffelStudio%20${_major}.${_minor}/Build_${_build}/Eiffel_${_major}.${_minor}_gpl_${_build}-linux-x86-64.tar.bz2")
sha256sums_x86_64=('e158b2e70d1355605e4274b427ab855af4f304bf3ea28621e83dee88b2168711')
source_i686=("http://downloads.sourceforge.net/project/eiffelstudio/EiffelStudio%20${_major}.${_minor}/Build_${_build}/Eiffel_${_major}.${_minor}_gpl_${_build}-linux-x86.tar.bz2")
sha256sums_i686=('2ba966b8829fe9367f694b3f629106fbecb36d92fa77f164c464fab59d1f2491')

prepare() {
	# remove windows files and folders
	find "${srcdir}/Eiffel_${_major}.${_minor}" -name "msc*" -type d -exec rm -rf {} +
	find "${srcdir}/Eiffel_${_major}.${_minor}" -name "*.dll" -type f -exec rm -rf {} +
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
