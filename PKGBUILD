# Maintainer: ntruessel <nicolas+arch@ntruessel.ch>
# Contributor: Domenico Iezzi <domenico.iezzi.201@gmail.com>

pkgname=eiffelstudio-bin
_major=20
_minor=11
_build=105048
pkgver=${_major}.${_minor}.${_build}
pkgrel=3
pkgdesc="IDE for the Eiffel programming language (opensource edition)"
arch=("x86_64")
url="https://www.eiffel.org/downloads"
license=("GPL")
depends=("gtk2" "libxtst" "gcc")
provides=("eiffelstudio")
conflicts=("eiffelstudio")
options=("staticlibs")
source=("eiffel-studio.profile"
	"https://www.eiffel.com/cdn/EiffelStudio/${_major}.${_minor}/${_build}/Eiffel_${_major}.${_minor}_rev_${_build}-linux-x86-64.tar.bz2"
        "eiffel-studio.desktop")
sha256sums=('3660f50b6900cecc22e79913d502a641a3355b9353bdf4b97185e6be100bb59a'
            '90d9bcd613bc8880d076c653a6bdb204c160b611f64c05f3cdb4aed7aa97a2dd'
            'bee49bd0a0fc335e32881918ff5374e4b1b9ecac32f72943f0256ee26e80345f')

prepare() {
	# remove windows files and folders
	find "${srcdir}/Eiffel_${_major}.${_minor}" -name "msc*" -type d -exec rm -rf {} +
	find "${srcdir}/Eiffel_${_major}.${_minor}" -name "*.dll" -type f -exec rm -rf {} +
}

package() {
	install -dm755 "${pkgdir}/opt"
	cp -a "${srcdir}/Eiffel_${_major}.${_minor}/" "${pkgdir}/opt/eiffel-studio"

	sed -i 's/@ARCH@/linux-x86-64/g' "${srcdir}/eiffel-studio.profile"

	install -Dm755 "${srcdir}/eiffel-studio.profile" "${pkgdir}/etc/profile.d/eiffel-studio.sh"
	install -Dm644 "${srcdir}/Eiffel_${_major}.${_minor}/studio/bitmaps/png/estudio.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/eiffel-studio.png"
	install -Dm644 "${srcdir}/eiffel-studio.desktop" "${pkgdir}/usr/share/applications/eiffel-studio.desktop"
}
