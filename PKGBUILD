# Maintainer: Filipp Andjelo <filipp at andjelo dot de>

pkgname=upm
pkgver=1.14
pkgrel=3
pkgdesc="Universal Password Manager"
arch=('any')
url="http://upm.sourceforge.net/"
license=('GPL2')
depends=('bash' 'java-environment')
source=("http://downloads.sourceforge.net/project/upm/upm-${pkgver}/upm-${pkgver}.tar.gz"
        upm.desktop)
sha256sums=('44b321b3e026f1bddfa91937c47c5079d3739843062e69a4cd5868190fcae526'
            '06073a7d8b55f299a2852dee814ac57c0ee05132191a9e204bb8c3ff9a554434')

package() {
    cd "${srcdir}"
    install -Dm 644 upm.desktop ${pkgdir}/usr/share/applications/upm.desktop

    cd "${pkgname}-${pkgver}"
    for f in *.jar; do
        install -Dm 644 $f ${pkgdir}/usr/lib/upm/$f
    done
    install -Dm 755 upm.sh ${pkgdir}/usr/lib/upm/upm.sh
    install -Dm 644 README.txt ${pkgdir}/usr/share/doc/upm/README.txt
    install -Dm 644 upm.png ${pkgdir}/usr/share/pixmaps/upm.png
    install -d ${pkgdir}/usr/bin/
    ln -s /usr/lib/upm/upm.sh ${pkgdir}/usr/bin/upm

    for f in server/http/*.php; do
        install -Dm 644 $f ${pkgdir}/usr/share/webapps/upm/$(basename $f)
    done
}
