# Maintainer: Anatolii Sakhnik <sakhnik@gmail.com>
pkgname=gpwsafe
pkgver=0.21.0
pkgrel=2
_revision=v${pkgver}
pkgdesc="A commandline program for managing encrypted password databases"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/sakhnik/gpwsafe"
license=('GPL')
depends=('libgcrypt' 'gtk3' 'libcap' 'boost')
makedepends=('cmake' 'gtest' 'asciidoc' 'python-pexpect')
source=(${url}/archive/${_revision}.tar.gz)
sha1sums=('34288363bdf5319bb6938c57822f28be6472e9e4')
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
