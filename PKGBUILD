# Maintainer: Denis Borisevich <elfmax@tut.by>

pkgname=jeveassets
pkgver=6.2.1
pkgrel=2
pkgdesc="Out-of-game asset manager for Eve-Online, written in Java"
arch=('any')
url="http://eve.nikr.net/jeveasset"
license=('GPL2')
depends=('jre8-openjdk' 'unzip')
install=$pkgname.install

source=(
	"https://github.com/GoldenGnu/jeveassets/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.zip"
        "https://eve.nikr.net/${pkgname}/data.zip"
        "packagemanager.properties"
        "$pkgname.desktop" 
        "${pkgname}_16x16.png"
        "${pkgname}_32x32.png"
        "${pkgname}_64x64.png"
        "$pkgname.sh")
md5sums=('937102414f6f5e3a1055b6fd74da5199'
         '5245507934f44cdd6a98e90aa1346fa5'
         '9313d681f64dc80ea2cc3b775310371f'
         '9d8d6da83c5e2ca7b2b47997f321ff1e'
         '35e020735f2fbe6f86acd749fc61dc43'
         '1a6847a033f7f1b9149e6b1630ee31a3'
         'b9578475c8ccfa347ac38ba809b8e2f5'
         '349f0b0edae2c5df570142d43071a7f1')
package() {

	install -d "$pkgdir/opt/"
	cp -dr --no-preserve=ownership "$srcdir/jEveAssets" "$pkgdir/opt/"
	install -Dm644 "$startdir/packagemanager.properties" "$pkgdir/opt/jEveAssets/packagemanager.properties"

	install -d "$pkgdir/usr/bin/"
	cp -dr --no-preserve=ownership "$srcdir/jeveassets.sh" "$pkgdir/usr/bin"

	install -Dm755 "$startdir/jeveassets.sh" "$pkgdir/usr/bin/jeveassets.sh"

	install -d "$pkgdir/usr/share/applications/"
	cp -dr --no-preserve=ownership "$srcdir/jeveassets.desktop" "$pkgdir/usr/share/applications/"

        for res in 16x16 32x32 64x64
        do
            install -Dm644 "$srcdir/${pkgname}_${res}.png" \
                "$pkgdir/usr/share/icons/hicolor/${res}/apps/jEveAssets.png"
        done

	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
