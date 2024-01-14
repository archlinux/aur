# Contributor: Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astroimagej
pkgver=5.3.2
pkgrel=1
pkgdesc="a simple and powerful tool for astronomical image analysis and precise photometry"
arch=('x86_64')
url="http://www.astro.louisville.edu/software/astroimagej/"
depends=('java-runtime')
license=('GPL')
source=("${url}installation_packages/AstroImageJ-v${pkgver}.00-linux-x86_64Bit.tar.gz"
        "aij" "astroimagej.desktop" "aij_image_display_w400.png")
sha256sums=('1ca49ff3f343f03624601c4376b0dfae688f3502110d4ebc24d1559c88db82cd'
            '402dff16ffd0cb1c12b091bddbb75621a245c83632675f6dacd3ffb76fc3f155'
            'aa98ef015ffcbb304a972112f88bb929d73c9675d196a4717926da01785dd771'
            '2b0b4541f8be3ea8c13f4428d8a6aaa95726937c59df82762adf2bb939235930')

package() {
	cd ${srcdir}
	tarfile="AstroImageJ-v${pkgver}.00-linux-x86_64Bit.tar.gz"

	mkdir ${pkgdir}/opt
	mkdir -p "$pkgdir/usr/share/applications"
  	mkdir -p "$pkgdir/usr/share/pixmaps"
        install -m755 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
        install -m755 "$srcdir/aij_image_display_w400.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

	cp $tarfile ${pkgdir}/opt
	cd ${pkgdir}/opt
	tar zxvf $tarfile
	rm $tarfile
	mv ${pkgdir}/opt/AstroImageJ ${pkgdir}/opt/astroimagej

	cd ${srcdir}
	install -D -m755 aij ${pkgdir}/usr/bin/aij
}

