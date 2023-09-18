# Maintainer: Markus Hartung <mail@hartmark.se>

_pkgname=pdx-unlimiter
_binname=Pdx-Unlimiter
pkgname=pdx-unlimiter-deb
pkgver=2.13.2
pkgrel=1
pkgdesc='A smart savegame manager, editor, and toolbox for all current major Paradox Grand Strategy games.'
arch=('x86_64')
license=('GPL3')
url='https://github.com/crschnick/pdx_unlimiter'
depends=(alsa-lib libxext libxi java-runtime glibc
	 libxrender libxtst libx11 zlib freetype2 bash)
optdepends=()

provides=("$_pkgname")
conflicts=("$_pkgname")
source=('Pdx-Unlimiter.desktop' 'https://github.com/crschnick/pdxu_launcher/releases/latest/download/pdxu_installer-linux.deb')
md5sums=('ed5c275358be85b14e2e0766680530a2'
         '44fd5b581d0aa4c77aea29b2bc0b7f5d')

package() {
	cd "${srcdir}"
	tar -xf data.tar.xz -C "${pkgdir}"

	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/bin/${_binname}" "${pkgdir}/usr/bin/${_pkgname}"

	# Fix permissions
	chmod -R go-w "${pkgdir}"

        install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/Pdx-Unlimiter.desktop"
}
