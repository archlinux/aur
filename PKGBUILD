# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=mutantblobsattack
pkgver=1.0
epoch=1414459118
pkgrel=1
pkgdesc="Tales From Space: Mutant Blobs Attack is a game where a blob eats stuff to grow bigger."
url="http://mutantblobsattack.com/"
arch=('x86_64' 'i686')
license=('custom:commercial')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
source=("hib://MutantBlobsAttack_linux_${epoch}.sh")
sha512sums=('8f38e75dafdab49ea6ad6d2d0783e030cab1d03d51a06d5f067d7439d77ac74c617edcf496c43deb4056667393167f8feb83f4736c01360807d22056f2f366d0')

# Uncomment if packaging takes too long
#PKGEXT=".pkg.tar"

package() {
	install -dm755 "${pkgdir}"/opt/${pkgname}/{media,lib32}
	install -m644 "${srcdir}"/data/noarch/media/* "${pkgdir}"/opt/${pkgname}/media/
	install -m644 "${srcdir}"/data/noarch/*.dat* "${pkgdir}"/opt/${pkgname}/
	install -m644 "${srcdir}"/data/x86/lib32/* "${pkgdir}"/opt/${pkgname}/lib32/
	install -Dm644 "${srcdir}"/data/noarch/README.linux "${pkgdir}"/usr/share/doc/${pkgname}/README
	install -Dm644 "${srcdir}"/data/noarch/MBA.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
	ln -s /usr/share/pixmaps/${pkgname}.png "${pkgdir}"/opt/${pkgname}/MBA.png
	install -m755 "${srcdir}"/data/x86/game-bin "${pkgdir}"/opt/${pkgname}/
	install -dm755 "${pkgdir}"/usr/bin
	echo "\#!/usr/bin/env sh
cd /opt/${pkgname}
LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:./lib32\" ./game-bin" > "${pkgdir}"/usr/bin/${pkgname}
	chmod 755 "${pkgdir}"/usr/bin/${pkgname}
	install -dm755 "${pkgdir}"/usr/share/applications
	echo "[Desktop Entry]
Encoding=UTF-8
Name=Mutant Blobs Attack
Comment=A game where a blob eats stuff to grow bigger.
Type=Application
Exec=${pkgname}
TryExec=${pkgname}
Icon=${pkgname}
Categories=Game;" > "${pkgdir}"/usr/share/applications/drinkbox-${pkgname}.desktop
}
