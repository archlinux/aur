# Maintainer: Denis Borisevich <elfmax@tut.by>
# Maintainer: Tyr Heimdal <tyr.heimdal@warning.no>

pkgname=jeveassets
pkgver=7.2.1
pkgrel=1
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

sha256sums=('5b550c267ef68441c48a2c9b39bbe42e4b84f0a496c0061151fb51060f0dd6f8'
            'd4f9a48ea6dfcb53179c68d66982729df21bcdcd765c34d3d9bc34ece8916814'
            '0203673802ba5102e8acae19c463ab1cd79663653cce38431362367d220f951e'
            '99dd564f33ea7e7a71980b829125207a53a18c2c31f5907d1e8842b64217d69b'
            '23ff2740653dddaafc0a40dcdadfa667a55d28389088dda8bc6eca1c66298150'
            '392c10b8b5c9f467eaf915542d5c0737d25ee44d0f14e14ca1099839fdc09daa'
            'c488589609bff3e2d60f191fb3bc149b19f31c6b3c25400a87639faf35126878'
            'eb94c90e9da414f351e027f4ddaae12ab563f5babbf0dfdbf9c13c7aa583c354')

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
