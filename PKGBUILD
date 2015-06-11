# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>
# Contributor: Sander Deryckere  <sanderd17@gmail.com>
# Maintainer: N. Izumi - izmntuk
pkgname=faience-azur-icon-theme-lite
pkgver=0.5.1
pkgrel=3
pkgdesc='An icon theme based on Faenza'
url='http://tiheum.deviantart.com/art/Faience-icon-theme-255099649'
license=('GPL3')
arch=('any')
conflicts=('faenza-icon-theme' 'faenza-icon-theme-lite' 'faience-icon-theme')
depends=('librsvg')
options=(!strip)
source=('http://ppa.launchpad.net/tiheum/equinox/ubuntu/pool/main/f/faience-icon-theme/faience-icon-theme_0.5.1.tar.gz'
	'http://ppa.launchpad.net/tiheum/equinox/ubuntu/pool/main/f/faenza-icon-theme/faenza-icon-theme_1.3.1.tar.gz')
sha256sums=(
	'da4e6e921c465caeb8904d4fc6a183b173c8000c08abce625b5b6739f5a0867a'
	'afd1c32229989e4cf09733c1ce5f2a651e585d86f45e98e9de6e8813f15d0edc'
)

package() {
	cd "${srcdir}/faenza-icon-theme-1.3"
	install -d "${pkgdir}/usr/share/icons/Faience-Azur"

	cp Faenza/index.theme "${pkgdir}/usr/share/icons/Faience-Azur"
	sed -i "${pkgdir}/usr/share/icons/Faience-Azur/index.theme" -e 's|Name=Faenza|Name=Faience\ Azur|'

	for i in actions apps categories mimetypes emblems devices places stock stock/io status;do
		mkdir "${pkgdir}/usr/share/icons/Faience-Azur/${i}"
		cp -rf Faenza/${i}/{scalable,16,22,24} "${pkgdir}/usr/share/icons/Faience-Azur/${i}"
	done

	cd ../faience-icon-theme-0.5
	for i in actions apps categories mimetypes emblems devices places stock status;do
		cp -rf Faience/${i}/{scalable,16,22,24} "${pkgdir}/usr/share/icons/Faience-Azur/${i}"
	done
	for i in Faience-Azur/{actions,apps,devices,places}/{scalable,16,22,24};do
		find ${i} -depth -type f -exec cp {} "${pkgdir}/usr/share/icons/${i}" \;
	done

	## set the Arch Linux Distributor and start menu logo
	cd "${pkgdir}/usr/share/icons/Faience-Azur/places/scalable/"
	ln -sf distributor-logo{-archlinux,}.svg
	ln -sf start-here{-archlinux,}.svg
	ln -sf start-here{-archlinux-symbolic,-symbolic}.svg

	## Mode fix
	find "${pkgdir}" -type d -exec chmod 755 {} +
	find "${pkgdir}" -type f -exec chmod 644 {} +
}
