# Maintainer: Anatolii Sakhnik <sakhnik@gmail.com>
pkgname=gpwsafe
pkgver=0.20.2
pkgrel=1
_revision=v${pkgver}
pkgdesc="A commandline program for managing encrypted password databases"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/sakhnik/gpwsafe"
license=('GPL')
depends=('libgcrypt' 'gtk3' 'libcap' 'boost')
makedepends=('cmake' 'gtest' 'asciidoc' 'python-pexpect')
source=(${url}/archive/${_revision}.tar.gz)
sha1sums=('0ce24f9016eae98bd492b97781c6bb6f802237f3')
install=${pkgname}.install

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    mkdir -p BUILD
    cd BUILD
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
    make ${MAKEFLAGS}
    LANG=C make check
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}/BUILD
    make DESTDIR=${pkgdir} install ${MAKEFLAGS}
}
