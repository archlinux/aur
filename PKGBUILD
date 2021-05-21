# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-kingdoms-and-castles
pkgver=117r7
pkgrel=1
pkgdesc="Kingdoms and Castles is a game about growing a kingdom from a tiny hamlet to a sprawling city and imposing castle"
arch=('i686' 'x86_64')
url="https://www.gog.com/game/kingdoms_castles"
license=('custom')
makedepends=('lgogdownloader')
depends=('bash' 'gtk2' 'gtk3' 'lib32-gdk-pixbuf2')
source=("kingdoms_and_castles_${pkgver//./_}.sh::gogdownloader://2067763543/en3installer0"
        "start-kingdoms-and-castles.sh"
        "Kingdoms and Castles.desktop")
sha512sums=('5e2bd652f119501b82525a82a089e35e0f13d6cf2ef68402e2e9e6612bca6912da7eccb8a971b9a4396b4aa90b3345f78cd409fcfc256ce59cd1d1efcb34bad1'
            'a928e02a78abab18fbe49e600ba5fb1d19b577df109fe3d9d5800c92210263a9e11b0bf1a8abac8ed1b773d57a4595f7f711344cfefa575f525d58c8d25277ba'
            '3f8c7438f09b670e8a34ff4efb5f3c6c5031c78492eff05a0ccadf6e60252b540ae8fd4682f84cc51a49b3db9389e0690a6ff6d6c9d01502f5f16683eb487247')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

package()
{
	mkdir -p "${pkgdir}/opt/$pkgname"
	mv "${srcdir}/data/noarch/game/KingdomsAndCastles_Data" "${pkgdir}/opt/$pkgname"
	chmod -R 644 "${pkgdir}/opt/$pkgname/"
	mkdir -p "${pkgdir}/opt/$pkgname/KingdomsAndCastles_Data/mods" #game does not start if folder does not exist
	find "${pkgdir}/opt/$pkgname" -type d -exec chmod 755 {} \;
	install -Dm 755 "${srcdir}/data/noarch/game/KingdomsAndCastles.x86"    "${pkgdir}/opt/$pkgname/KingdomsAndCastles.x86"
	install -Dm 755 "${srcdir}/data/noarch/game/KingdomsAndCastles.x86_64" "${pkgdir}/opt/$pkgname/KingdomsAndCastles.x86_64"
	install -Dm 755 "${srcdir}/start-kingdoms-and-castles.sh" "${pkgdir}/usr/bin/kingdoms-and-castles"
	install -Dm 755 "${srcdir}/Kingdoms and Castles.desktop" "$pkgdir/usr/share/applications/Kingdoms and Castles.desktop"
	install -Dm 644 "${srcdir}/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
	install -Dm 644 "${srcdir}/data/noarch/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
