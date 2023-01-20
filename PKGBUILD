# Maintainer: ResetPower <resetpower20@gmail.com>

pkgname=epherome
pkgrel=1
_pkgname=Epherome
pkgver=0.7.2
_electron=electron
pkgdesc="Powerful Minecraft Launcher."
arch=('x86_64')
license=('GPL')
url="https://epherome.com/"
provides=('epherome')
conflicts=('epherome')
depends=("${_electron}")
_filename="${_pkgname}-${pkgver}.deb"
source=("${_pkgname}-${pkgver}.deb::https://github.com/ResetPower/Epherome/releases/download/${pkgver}/$_filename")
sha512sums=('db640860e9e6b0fcbec344fc5355ea32ff3c52b5a386d045faed6894e5920e3bf09d61e9632f8a00e6131b37f4ae8ca9d342c37e464749f28d19a85a0dc0742a')

prepare(){
	bsdtar -xf data.tar.xz -C "$srcdir/"
	sed -i "s|__ELECTRON__|${_electron}|" ${srcdir}/${_pkgname}.sh
}

package() {
	cd $srcdir
	cp -rf usr ${pkgdir}
	install -Dm644 "$pkgdir/usr/share/doc/$_pkgname/copyright" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	mkdir -p ${pkgdir}/usr/lib/epherome
	mv ${pkgdir}/usr/share/ephrome/resources/* ${pkgdir}/usr/lib/ephrome

	rm -rf ${pkgdir}/usr/share/epherome
}
