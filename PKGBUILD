# Maintainer: Denis Borisevich <elfmax@tut.by>
# Maintainer: Tyr Heimdal <tyr.heimdal@warning.no>

pkgname=jeveassets
pkgver=6.8.0
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
sha256sums=('68afbccb33eb21925f432caf337fadf96f6b8c5392c1171ed7ef31eba8dd9c6b'
            '478ae4d0ca1e6801c6c6283a07f14d9357fbc01212580e6529d64b7cf24cdb1d'
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
