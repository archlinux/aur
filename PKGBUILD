# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen@gmail.com>
pkgname=jack-editor
pkgver=1.1.1064
pkgrel=2
pkgdesc="J.A.C.K. is a brand new level editor for games with a quake-style BSP architecture."
arch=("x86_64")
url=""
license=('GPL')
depends=(nas libpng12)
source=("jackhammer.run::http://jack.hlfx.ru/en/download_jackhammer_linux64.html")
sha256sums=("f2d02affd843a0d3191b45096435d7bcd7b2cf0d9d55ff3bc6094b732f41a4fa")

build() {
	chmod +x jackhammer.run
	./jackhammer.run --noexec --keep
}

package() {
	mv -f linux_x64 jack
	rm -f jack/install.sh
	mv -f jack/Jack.desktop .
	find jack -type d -exec chmod +x {} \;
	find jack -type f -exec chmod +r {} \;
	mkdir -p -m755 ${pkgdir}/opt/jack
	mkdir -p -m755 ${pkgdir}/usr/bin
	cp -rv jack ${pkgdir}/opt
	install -D -m644 Jack.desktop ${pkgdir}/usr/share/applications/Jack.desktop
	ln -s /opt/jack/Jack.sh ${pkgdir}/usr/bin/Jack 
}
