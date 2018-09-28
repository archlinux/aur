# Maintainer: Ludovico de Nittis <aasonykk+aur at google mail dot com>
# Forked from Phillipe Smith <phillipe@archlinux.com.br>

pkgname=astah-uml
_pkgname=${pkgname/-/_}
pkgver=8.0.0
_pkgver=${pkgver//./_}
pkgrel=1
_pkgrel=d641d4
pkgdesc="Lightweight and easy-to-use UML2.x modeler"
arch=("any")
license=("custom")
depends=("java-runtime>=8")
makedepends=("shared-mime-info" "gtk-update-icon-cache" "desktop-file-utils")
provides=("$_pkgname")
conflicts=("$_pkgname" "astah_community" "astah-professional")
install="${pkgname}.install"
url="http://astah.net/editions/uml-new"
source=("http://cdn.change-vision.com/files/${pkgname}-${_pkgver}-${_pkgrel}.zip"
        "${_pkgname}.desktop"
        "${_pkgname}.xml"
        "${_pkgname}.png"
        "astah_splash_uml.png"
        "LICENSE")

sha256sums=('b57ba78cbfed29940f065ea8acd890c8cad3468581f034e4fdb2cc03093d0bbf'
            '560cdde7f1bb1fde639a8dd82deab6ee3ae6366d8385e485f32c050f4269592d'
            '0f820a854465a84a0ec718108bee8d96b572f1eb4ab4c558d83c13eb5eb03513'
            '5b02d285410a97e29eb0888b1c095d200bbecc14edc2e9129c281691c3021f49'
            '35f96337f046d3ce25a61db4aa79fe2036e515b090eea597f4b3df081adb9006'
            'da5c641c2a9f1e0d616d142ad340b9724b798f55cfb30ba171bee7be2530aa1a')

package() {         
    install -Dm755 $srcdir/$_pkgname/astah $pkgdir/usr/bin/astah || return 1
    install -Dm755 $srcdir/$_pkgname/astah-command.sh $pkgdir/usr/bin/astah-command || return 1
    install -Dm644 $srcdir/${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop || return 1
    install -Dm644 $srcdir/${_pkgname}.xml $pkgdir/usr/share/mime/packages/${_pkgname}.xml || return 1
    install -Dm644 $srcdir/${_pkgname}.png $pkgdir/usr/share/pixmaps/${_pkgname}.png || return 1
    install -Dm644 $srcdir/astah_splash_uml.png ${srcdir}/${_pkgname}/astah_splash_uml.png || return 1
    install -Dm644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE || return 1
    mkdir -p ${pkgdir}/usr/lib/
    cp -rf ${srcdir}/${_pkgname}/ ${pkgdir}/usr/lib/${pkgname} || return 1
    chmod +x ${pkgdir}/usr/lib/${pkgname}/astah{,-command.sh}
    sed -i -r "s|^(ASTAH_HOME=).*|\1/usr/lib/$pkgname|" ${pkgdir}/usr/bin/astah
}
