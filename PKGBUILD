# Contributor: Jon Ribeiro <contact@jonathas.com>
pkgname=web-to-webm
pkgver=0.7.2
pkgrel=2
pkgdesc="Gui tool for extracting webm clips from Youtube and many other video hosting services"
arch=("i686" "x86_64")
url="https://solusipse.github.io/web-to-webm/"
license=('MIT')
depends=('youtube-dl' 'ffmpeg' 'qt5-webkit')

source=("https://github.com/solusipse/${pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('e97327b5ec2fbdaf67b945357bb188fd2451a831463d73bdb81aadc4f6a2b5e1')

package() {	
	install -d "$pkgdir"/opt
	qmake-qt5 "$srcdir"/${pkgname}-${pkgver}/${pkgname}.pro
	make || return 1
	make clean
	cp -R "$srcdir" "$pkgdir"/opt/${pkgname}

	find "$pkgdir"/opt/${pkgname}/ -type f -exec chmod 755 {} \;
	chmod 755 "$pkgdir"/opt/${pkgname}/${pkgname}

	install -d "$pkgdir"/usr/bin
	ln -s "$pkgdir"/opt/${pkgname}/${pkgname} "$pkgdir"/usr/bin/${pkgname}
	
	rm "$pkgdir"/opt/${pkgname}/${pkgver}.tar.gz #Removing the symbolic link
	rm "$pkgdir"/opt/${pkgname}/Makefile
	rm -R "$pkgdir"/opt/${pkgname}/${pkgname}-${pkgver}
}

