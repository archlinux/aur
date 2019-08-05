# Maintainer: Kaio Augusto <kaioaugusto.8@gmail.com>
# Contributor: Kyle <kyle@free2.ml>
# Contributor: mib1982 <Mi.Bentlage@gmail.com>
# Contributor: z3ntu <luca.emanuel.weiss@gmail.com>

pkgname=f3
pkgver=7.2
pkgrel=1
pkgdesc="Utilities to detect and repair counterfeit flash storage, i.e. thumb drives and memory cards with less flash than advertised"
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="http://oss.digirati.com.br/f3/"
license=('GPL3')
depends=('parted')
options=('!buildflags'
         '!makeflags')
conflicts=()
provides=()
source=(https://github.com/AltraMayor/${pkgname}/archive/v${pkgver}.zip)
md5sums=('23026d5463e9ec2b36a00a42ec8f0d5f')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    sed -i -e 's:/usr/local:/usr:g' Makefile
    make
    make extra
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=$pkgdir install
    make DESTDIR=$pkgdir install-extra
}
