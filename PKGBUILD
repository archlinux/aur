# Maintainer: Dominic Radermacher <dominic.radermacher@gmail.com>

pkgname=dxx-rebirth
pkgver=0.59.100
pkgrel=1
pkgdesc="An enhanced engine to play Descent 1 / Descent 2"
arch=('i686' 'x86_64')
url="http://www.dxx-rebirth.com/"
license=('custom:D1x' 'LGPL' 'custom:as-is')
depends=('sdl' 'sdl_mixer' 'mesa' 'physfs')
makedepends=('scons' 'unzip')
conflicts=('d1x-rebirth' 'd2x-rebirth')
replaces=('d1x-rebirth' 'd2x-rebirth')
install=${pkgname}.install
source=("http://www.dxx-rebirth.com/download/dxx/${pkgname}_v${pkgver}-src.tar.gz"
        "http://www.dxx-rebirth.com/download/dxx/res/d2xr-sc55-music.dxa")
noextract=("d2xr-sc55-music.dxa")
sha256sums=('6a1e1e589a007389df56efb9f7355efc36e7ea01e4c6af53b46ba1ec3f193355'
            'ace152182c70b9a7ae6f911bddbc239566220a287ab5419cab260d5af739bf16')

build() {
	cd "${srcdir}/${pkgname}_v${pkgver}-src"
	sed -ie "/^PREFIX =/s|/usr/local/|/usr/|" SConstruct
	scons sharepath="/usr/share/${pkgname}"
}

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

	install -m755 "${srcdir}/${pkgname}_v${pkgver}-src/d1x-rebirth/d1x-rebirth" "${pkgdir}/usr/bin/"
	install -m755 "${srcdir}/${pkgname}_v${pkgver}-src/d2x-rebirth/d2x-rebirth" "${pkgdir}/usr/bin/"

	install -m644 "${srcdir}/${pkgname}_v${pkgver}-src/d1x-rebirth/d1x-rebirth.xpm" "${pkgdir}/usr/share/pixmaps/"
	install -m644 "${srcdir}/${pkgname}_v${pkgver}-src/d2x-rebirth/d2x-rebirth.xpm" "${pkgdir}/usr/share/pixmaps/"

	install -m644 "${srcdir}/${pkgname}_v${pkgver}-src/d1x-rebirth/d1x-rebirth.desktop" "${pkgdir}/usr/share/applications/"
	install -m644 "${srcdir}/${pkgname}_v${pkgver}-src/d2x-rebirth/d2x-rebirth.desktop" "${pkgdir}/usr/share/applications/"

	install -m644 "${srcdir}/${pkgname}_v${pkgver}-src/COPYING.txt" "${pkgdir}/usr/share/licenses/$pkgname/"
	install -m644 "${srcdir}/d2xr-sc55-music.dxa" "${pkgdir}/usr/share/${pkgname}/"
} 
