# Maintainer: Kyle <kyle@gmx.ca>
# Contributor: mib1982 <Mi.Bentlage@gmail.com>
# Contributor: z3ntu <luca.emanuel.weiss@gmail.com>

pkgname=f3-test
_pkgname=f3
pkgver=6.0
pkgrel=5
pkgdesc="Utilities to detect and repair counterfeit flash storage, i.e. thumb drives and memory cards with less flash than advertised"
arch=('i686' 'x86_64')
url="http://oss.digirati.com.br/f3/"
license=('GPL3')
depends=('parted')
options=('!buildflags'
         '!makeflags'
         'strip' 'debug')
conflicts=()
provides=()
source=(https://github.com/AltraMayor/f3/archive/v${pkgver}.zip)
md5sums=('b38abfb1c35996e4d193d3be694b4448')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    make
    make experimental
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    install -m 755 -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/man/man1
    install -m 755 f3brew f3fix f3probe f3read f3write f3write.h2w log-f3wr ${pkgdir}/usr/bin/
    install -m 644 f3read.1 ${pkgdir}/usr/share/man/man1/    
    cd ${pkgdir}/usr/share/man/man1
    ln -s f3read.1 f3write.1
}
