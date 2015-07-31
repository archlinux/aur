# Maintainer: Phillipe Smith <phillipe@archlinux.com.br>
pkgname=astah-community
_pkgname=${pkgname/-/_}
pkgver=7.0.0
_pkgver=${pkgver//./_}
pkgrel=1
_pkgrel=846701
pkgdesc="Lightweight, easy-to-use, and free UML2.x modeler"
arch=("any")
license=("custom")
depends=("java-runtime")
provides=("$_pkgname")
conflicts=("$_pkgname" "astah-professional")
install="${pkgname}.install"
url="http://astah.change-vision.com/en/product/${pkgname}.html"
source=("http://cdn.astah.net/downloads/${pkgname}-${_pkgver}-${_pkgrel}.zip"
        "${_pkgname}.desktop"
        "${_pkgname}.xml"
        "${_pkgname}.png"
        "astah_splash_community.png"
	"LICENSE")
md5sums=("24ac9f33bf45a2a592d3f7571437b031"
         "e374756203ba7e4a52309cbe38208683"
         "d728cbad449409131ed96edf89053caf"
         "b20ec64a7e6b1ad395c6eed7e8a851b7"
         "95e5566bcef2eb2f7ee5a8ec99eae8af"
         "3b5f3a3c4e453544e9c665c7950960fc")

package() {         
    install -Dm755 $srcdir/$_pkgname/astah $pkgdir/usr/bin/astah || return 1
    install -Dm755 $srcdir/$_pkgname/astah-command.sh $pkgdir/usr/bin/astah-command || return 1
    install -Dm644 $srcdir/${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop || return 1
    install -Dm644 $srcdir/${_pkgname}.xml $pkgdir/usr/share/mime/packages/${_pkgname}.xml || return 1
    install -Dm644 $srcdir/${_pkgname}.png $pkgdir/usr/share/pixmaps/${_pkgname}.png || return 1
    install -Dm644 $srcdir/astah_splash_community.png ${pkgdir}/usr/lib/${_pkgname}/astah_splash_community.png || return 1
    install -Dm644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE || return 1
    cp -rf $srcdir/$_pkgname/ ${pkgdir}/usr/lib/$pkgname || return 1
    chmod +x $pkgdir/usr/lib/${pkgname}/astah{,-command.sh}
    sed -i -r "s|^(ASTAH_HOME=).*|\1/usr/lib/$pkgname|" ${pkgdir}/usr/bin/astah
}
