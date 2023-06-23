pkgname=vstar-aavso
_pkgname=vstar
pkgver=2.22.0
pkgrel=2
pkgdesc="VStar is a multi-platform, easy-to-use variable star data visualization and analysis tool that was originally developed as part of the AAVSOs Citizen Sky project."
arch=('any')
url="https://www.aavso.org/vstar"
makedepends=('ant')
depends=('java-environment-common')
license=('AGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AAVSO/VStar/archive/refs/tags/${pkgver}.tar.gz"
	"vstar" "vstar.desktop")
sha256sums=('12d2a1bd9b8a620090139c7658a079b38816730408cb86d9fc956ba817b11473'
            '3ff10bedbc12dc37a7995602c67298e0df6a701bc568a29c1821d07e2046187d'
            'a7f7ed7413eb454f89a5674e00077a661ed6d96d8b7c4356f2ac27278a83a272')


build() {
	cd "${srcdir}/VStar-${pkgver}"
	ant compile_src
	ant dist
}

package() {
	mkdir -p "$pkgdir/opt/${_pkgname}"
        mkdir -p "$pkgdir/usr/bin"
        mkdir -p "$pkgdir/usr/share/applications"
        mkdir -p "$pkgdir/usr/share/pixmaps"
        install -m755 "$srcdir/VStar-${pkgver}/extlib/vstaricon.png" "$pkgdir"/usr/share/pixmaps
        install -m755 "$srcdir/vstar" "$pkgdir"/usr/bin/vstar
        install -m755 "$srcdir/vstar.desktop" "$pkgdir"/usr/share/applications
	cd "${srcdir}/VStar-${pkgver}/" 
	mv * "$pkgdir/opt/${_pkgname}/"
}
