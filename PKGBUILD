# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=cruiser
pkgver=1.2.7
pkgrel=1
pkgdesc="Map and navigation application using offline vector maps"
arch=('any')
url="http://wiki.openstreetmap.org/wiki/Cruiser"
license=('proprietary (free)')
depends=('java-runtime')
conflicts=('atlas-maps')
replaces=('atlas-maps' 'atlas-maps-bin' 'atlas-maps-beta-bin')
source=("http://www.talent.gr/public/cruiser/cruiser-${pkgver}.zip"
        "cruiser.sh")
md5sums=('eb749b9792b2eadc6fb6afa928ee7f35'
         '6c23697fc0421c752227dd1e1f29245f')

build () {
    sed 's/cruiser.jar/cruiser-gl.jar/' cruiser.sh > cruiser-gl.sh
}

package() {
    for _f in cruiser{,-gl}; do
        install -Dm644 "cruiser/$_f.jar" "$pkgdir/usr/share/java/cruiser/$_f.jar"
        install -Dm755 "$_f.sh" "$pkgdir/usr/bin/$_f"
    done

    cd cruiser/lib
    for _f in *.jar; do
        install -Dm644 "$_f" "$pkgdir/usr/share/java/cruiser/lib/$_f"
    done
}
