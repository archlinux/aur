# Maintainer: Sebastian Lau <archlinux _at_ slau _dot_ info>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Contributor: Romain Schmitz <slopjong .at. slopjong .dot. de>
# Forked from Phillipe Smith <phillipe@archlinux.com.br>

pkgname='astah-professional'
_pkgname=${pkgname//-/_}
pkgver='7.0.0'
_pkgver=${pkgver//./_}
pkgrel=1
_pkgrel=846701
pkgdesc='easy-to-use UML2.x modeler'
arch=('any')
url="http://astah.net/editions/professional"
conflicts=('astah_community')
license=('custom:none')
depends=('java-runtime')
source=("http://cdn.astah.net/downloads/${pkgname}-${_pkgver}-$_pkgrel.zip"
	"astah-professional.desktop"
	"astah-professional.png"
	"astah-professional.xml"
	"astah-professional-doc.png"
	"LICENSE")

md5sums=('72d70aa8385315016a14905e3ca8eeee'
         '7f85e4ae3c0331d8a7d842a0c17090f9'
         'df84e754977e1958963779b3a59182e1'
         '2fbccb662c6435f75c62751437fb3f1e'
         '4dbc30adaf0a7af35fdf16a04c44b80c'
         '3b5f3a3c4e453544e9c665c7950960fc')

install="astah-professional.install"

package() {
    install -Dm755 $srcdir/$_pkgname/astah $pkgdir/usr/bin/astah || return 1
    install -Dm755 $srcdir/$_pkgname/astah-command.sh $pkgdir/usr/bin/astah-command || return 1
    install -Dm644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop || return 1
    install -Dm644 $srcdir/${pkgname}.xml $pkgdir/usr/share/mime/packages/${pkgname}.xml || return 1
    install -Dm644 $srcdir/${pkgname}.png $pkgdir/usr/share/pixmaps/${pkgname}.png || return 1
    install -Dm644 $srcdir/${pkgname}-doc.png $pkgdir/usr/share/pixmaps/${pkgname}-doc.png || return 1
    install -Dm644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE || return 1
    install -Dm755 -d ${pkgdir}/usr/lib || return 1
    cp -rf $srcdir/$_pkgname ${pkgdir}/usr/lib/$pkgname || return 1
    rm $pkgdir/usr/lib/${pkgname}/astah{,-command.sh}
    
    sed -i -r "s|^(ASTAH_HOME=).*|\1/usr/lib/$pkgname|" ${pkgdir}/usr/bin/astah
}
