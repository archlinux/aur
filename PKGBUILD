# Maintainer: Davikch <davidogluzd@gmail.com>

pkgname=space-funeral
pkgver=1.1.0
pkgrel=1
pkgdesc="A short comedy adventure game made by thecatamites with RPG Maker 2003"
url='https://thecatamites.itch.io/space-funeral'
arch=('any')
license=('LicenseRef-Freeware')

depends=('easyrpg-player')
makedepends=('libarchive')

source=("https://archive.org/download/space-funeral/Space_Funeral.rar"
	${pkgname}.desktop
	${pkgname}.sh)

sha256sums=('ab54f037b9f67abc35842e9fbfb7649845695870528d56f6350d1ee548e92f09'
	'65024f76c20472e714951a2263fa42c6dc1a19049867ab3f854fb92ff650dd5d'
	'927b610b3a943226e68b80a27cd12fbb9fde75838485296b421b2d1d21397577')

package() {
	mkdir ${pkgname}
	bsdtar -xf 'Space_Funeral.rar' -C ${pkgname} --strip-components 1
	rm -r $pkgname/{Movie,Frame,Battle2,Picture,Battle,BattleWeapon}
	(
		install -d "$pkgdir/opt"
		mv $pkgname "$pkgdir/opt/$pkgname"
		install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
		install -Dm644 "${pkgname}.desktop" -t "$pkgdir/usr/share/applications"
	)
}
