# Maintainer: Hurstel Alexandre <alexandre at hurstel dot eu>
# Co-Maintainer: Tobias Manske <aur at rad4day dot de>
pkgname=xp-pen-tablet
pkgver=3.2.0.210804
epoch=1
pkgrel=1
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('LGPL3')
conflicts=(xp-pen)
source=("https://download01.xp-pen.com/file/20${pkgver: -6:2}/${pkgver: -4:2}/XP-PEN-pentablet-${pkgver}-1.${CARCH}.tar.gz"
        "install.sh.patch"
)
sha256sums=('210d5686de9d789d996b20de8cad01eaa7b591a244c6aaa9f7158a2390771ccf'
    'ae59e8006eb79b6a623e0b3cc1063d337c789d9fd5f1ea5aceedb743e955c085'
)

prepare() {
    cd "$srcdir/xp-pen-pentablet-${pkgver}-1.${CARCH}"

    patch < "$srcdir/install.sh.patch"
}


package() {
    cd "$srcdir/xp-pen-pentablet-${pkgver}-1.${CARCH}"

	mkdir -p "${pkgdir}/usr/lib/pentablet"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/icons/"
	mkdir -p "${pkgdir}/etc/xdg/autostart"
	mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"

	./install.sh "${pkgdir}"
}
