
# Maintainer: Your Name <youremail@domain.com>
# Contributor: Asuka Minato
pkgname=buka-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="a modern software that helps you manage your ebook at ease."
arch=(x86_64)
url="https://github.com/oguzhaninan/Buka"
license=('GPL3')
depends=(bash gconf electron4) # at least 4 works
source=("https://github.com/oguzhaninan/Buka/releases/download/v1.0.0/Buka-1.0.0.pacman"
        )
sha256sums=('353f96fed41148cb3f1852dc0c0d3635949ea775d024314332af3606f0b483a5')

package() {
	rm -v *.pacman
	cp -av * $pkgdir
	for f in $pkgdir/opt/Buka/*;
	do	
		if [ $(basename "$f") != "resources" ];
		then
			rm -rfv "$f"
		fi
	done
	install -Dm755 /dev/null $pkgdir/opt/Buka/buka
	echo "#!/bin/sh" >> $pkgdir/opt/Buka/buka
	echo "electron4 /opt/Buka/resources/app.asar" >> $pkgdir/opt/Buka/buka		
}
