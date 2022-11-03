# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-kingdoms-and-castles
pkgver=120r1
pkgrel=1
pkgdesc="Kingdoms and Castles is a game about growing a kingdom from a tiny hamlet to a sprawling city and imposing castle"
arch=('x86_64')
url="https://www.gog.com/game/kingdoms_castles"
license=('custom')
makedepends=('lgogdownloader')
depends=('bash' 'gtk2' 'gtk3' 'lib32-gdk-pixbuf2')
source=("kingdoms_and_castles_${pkgver//./_}.sh::gogdownloader://2067763543/en3installer0"
        "start-kingdoms-and-castles.sh"
        "Kingdoms and Castles.desktop")
sha512sums=('3c5838c992533cd78ef0660252df66f124228dec62e23c520ee70c79254e6c7fa4ae759fbf8ae8fe59107882c5805508e02e259e03fded36b48e6a447734e8c6'
            'a77d13ec722feb49f38f54441cb9e0003dbca2849f6e6f942683ffc461aa99b602037173b3d469fd226818cb92706f960e5edd4612b8d0bb22c7ff0f16684077'
            '3f8c7438f09b670e8a34ff4efb5f3c6c5031c78492eff05a0ccadf6e60252b540ae8fd4682f84cc51a49b3db9389e0690a6ff6d6c9d01502f5f16683eb487247')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

package()
{
	mkdir -p "${pkgdir}/opt/$pkgname/lib"
	mv "${srcdir}/data/noarch/game/KingdomsAndCastles_Data" "${pkgdir}/opt/$pkgname"
	chmod -R 644 "${pkgdir}/opt/$pkgname/"
	mkdir -p "${pkgdir}/opt/$pkgname/KingdomsAndCastles_Data/mods" #game does not start if folder does not exist
	find "${pkgdir}/opt/$pkgname" -type d -exec chmod 755 {} \;
	install -Dm 755 "${srcdir}/data/noarch/game/UnityPlayer.so" "${pkgdir}/opt/$pkgname/lib/"
	install -Dm 755 "${srcdir}/data/noarch/game/KingdomsAndCastles.x86_64" "${pkgdir}/opt/$pkgname/KingdomsAndCastles.x86_64"
	install -Dm 755 "${srcdir}/start-kingdoms-and-castles.sh" "${pkgdir}/usr/bin/kingdoms-and-castles"
	install -Dm 755 "${srcdir}/Kingdoms and Castles.desktop" "$pkgdir/usr/share/applications/Kingdoms and Castles.desktop"
	install -Dm 644 "${srcdir}/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
	install -Dm 644 "${srcdir}/data/noarch/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
