# Maintainer: Filipp Andjelo <filipp at andjelo dot de>

pkgname=upm
pkgver=1.14
pkgrel=2
pkgdesc="Universal Password Manager"
arch=('any')
url="http://upm.sourceforge.net/"
license=('GPL2')
depends=('bash' 'java-environment')
source=("http://downloads.sourceforge.net/project/upm/upm-${pkgver}/upm-${pkgver}.tar.gz")
sha256sums=('44b321b3e026f1bddfa91937c47c5079d3739843062e69a4cd5868190fcae526')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
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
