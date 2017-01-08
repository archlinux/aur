# Maintainer: Anatolii Sakhnik <sakhnik@gmail.com>
pkgname=gpwsafe
pkgver=0.21.5
pkgrel=1
_revision=v${pkgver}
pkgdesc="A commandline program for managing encrypted password databases"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/sakhnik/gpwsafe"
license=('GPL')
depends=('libgcrypt' 'gtk3' 'libcap' 'boost')
makedepends=('cmake' 'gtest' 'asciidoc' 'expect')
source=(${url}/archive/${_revision}.tar.gz)
sha1sums=('1718270acbbb0f5d48717447c08bb5134bb95e7d')
install=${pkgname}.install

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    mkdir -p BUILD
    cd BUILD
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
    make ${MAKEFLAGS}
    LANG=C CTEST_OUTPUT_ON_FAILURE=1 make test
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}/BUILD
    make DESTDIR=${pkgdir} install ${MAKEFLAGS}
}
