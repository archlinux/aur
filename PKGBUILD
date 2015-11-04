# Maintainer: Phillipe Smith <phillipe@archlinux.com.br>
pkgname=astah-community
pkgver=7.0.0
pkgrel=1
_altpkgname=astah_community
_realpkgrel=846701
pkgdesc='Lightweight, easy-to-use, and free UML2.x modeler'
arch=('any')
url='http://astah.change-vision.com/en/product/astah-community.html'
license=('custom')
depends=('java-runtime')
provides=('astah_community')
conflicts=('astah_community')
source=("http://cdn.astah.net/downloads/${pkgname}-${pkgver//./_}-${_realpkgrel}.zip"
        'astah_community.desktop'
        'astah_community.xml'
        'astah_community.png'
        'astah_splash_community.png'
	'LICENSE')
md5sums=('24ac9f33bf45a2a592d3f7571437b031'
         'e374756203ba7e4a52309cbe38208683'
         'd821b7726b61ce1c15ef84e31c0c0505'
         'b20ec64a7e6b1ad395c6eed7e8a851b7'
         '95e5566bcef2eb2f7ee5a8ec99eae8af'
         '3b5f3a3c4e453544e9c665c7950960fc')

package() {         
    install -Dm755 $srcdir/$_altpkgname/astah $pkgdir/usr/bin/astah || return 1
    install -Dm755 $srcdir/$_altpkgname/astah-command.sh $pkgdir/usr/bin/astah-command || return 1
    install -Dm644 $srcdir/${_altpkgname}.desktop $pkgdir/usr/share/applications/${_altpkgname}.desktop || return 1
    install -Dm644 $srcdir/${_altpkgname}.xml $pkgdir/usr/share/mime/packages/${_altpkgname}.xml || return 1
    install -Dm644 $srcdir/${_altpkgname}.png $pkgdir/usr/share/pixmaps/${_altpkgname}.png || return 1
    install -Dm644 $srcdir/astah_splash_community.png ${pkgdir}/usr/lib/${_altpkgname}/astah_splash_community.png || return 1
    install -Dm644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${_altpkgname}/LICENSE || return 1
    cp -rf $srcdir/$_altpkgname/ ${pkgdir}/usr/lib/$pkgname || return 1
    chmod +x $pkgdir/usr/lib/${pkgname}/astah{,-command.sh}
    sed -i -r "s|^(ASTAH_HOME=).*|\1/usr/lib/$pkgname|" ${pkgdir}/usr/bin/astah
}
