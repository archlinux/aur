# Maintainer: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=lttng-tools
pkgver=2.6.0
pkgrel=1
pkgdesc="Trace control client for LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('GPL2' 'LGPL2.1')
provides=('lttng')
source=(http://lttng.org/files/$pkgname/$pkgname-$pkgver.tar.bz2
        ${pkgname}-gcc51.patch)
depends=('popt' 'liburcu>=0.7.2' 'lttng-ust' 'linux>=2.6.27' 'libxml2>=2.7.6')
optdepends=('lttng-modules: kernel tracing support' 'babeltrace: trace viewing')
options=('!libtool')
sha1sums=('cdcbcb527b665d4df409fd7a8013dba97566190a'
          'fe1deab975f2a453b5abf3f173f57477fcb8ad45')


prepare()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    patch -Np1 -i ../${pkgname}-gcc51.patch
}

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make install DESTDIR=${pkgdir}
}
