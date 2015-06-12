# Maintainer: Jozef Riha <jose1711@gmail.com>
# Contributor: karnath
pkgname=logintop10
pkgver=1.9
pkgrel=2
pkgdesc="Command-line utility that creates several top-10 lists from the wtmp (usually in /var/log/) on your system."
arch=('i686' 'x86_64')
license=('GPL')
url=("http://www.vanheusden.com/logintop10/")
source=(http://www.vanheusden.com/logintop10/logintop10-1.9.tgz)
depends=('glibc')
md5sums=('e816ad4eb9f18b0f779241df1c4d971a')

build() {
        cd ${srcdir}/$pkgname-$pkgver
        sed -i "/LOCALE_PATH/s/\b\/local\b//" Makefile
        make
}

package() {
        mkdir -p ${pkgdir}/usr/{bin,share/locale/{nl,fr,es,ar,de}/LC_MESSAGES,share/man/man1}
        mv -v ${srcdir}/${pkgname}-${pkgver}/logintop10 ${pkgdir}/usr/bin/
        mv -v ${srcdir}/${pkgname}-${pkgver}/logintop10-nl.mo ${pkgdir}/usr/share/locale/nl/LC_MESSAGES/logintop10.mo
        mv -v ${srcdir}/${pkgname}-${pkgver}/logintop10-fr.mo ${pkgdir}/usr/share/locale/fr/LC_MESSAGES/logintop10.mo
        mv -v ${srcdir}/${pkgname}-${pkgver}/logintop10-es.mo ${pkgdir}/usr/share/locale/es/LC_MESSAGES/logintop10.mo
        mv -v ${srcdir}/${pkgname}-${pkgver}/logintop10-ar.mo ${pkgdir}/usr/share/locale/ar/LC_MESSAGES/logintop10.mo
        mv -v ${srcdir}/${pkgname}-${pkgver}/logintop10-de.mo ${pkgdir}/usr/share/locale/de/LC_MESSAGES/logintop10.mo
        mv -v ${srcdir}/${pkgname}-${pkgver}/logintop10.1 ${pkgdir}/usr/share/man/man1/logintop10.1
        gzip -9 ${pkgdir}/usr/share/man/man1/logintop10.1
        chmod 755 ${pkgdir}/usr/bin/logintop10
        chmod 644 ${pkgdir}/usr/share/locale/nl/LC_MESSAGES/logintop10.mo
        chmod 644 ${pkgdir}/usr/share/locale/fr/LC_MESSAGES/logintop10.mo
        chmod 644 ${pkgdir}/usr/share/locale/es/LC_MESSAGES/logintop10.mo
        chmod 644 ${pkgdir}/usr/share/locale/ar/LC_MESSAGES/logintop10.mo
        chmod 644 ${pkgdir}/usr/share/locale/de/LC_MESSAGES/logintop10.mo
}

