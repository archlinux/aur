# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Contributor: Daniel Perez <tuvistavie@gmail.com>
# Contributor: AGWA
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: noirbizarre <noirbizarre@gmail.com>
# Contributor: Wael Nasreddine <wael.nasreddine@gmail.com>

pkgname=git-crypt
pkgver=0.5.0
pkgrel=5
pkgdesc="Transparent file encryption in Git"
arch=('i686' 'x86_64')
url="https://www.agwa.name/projects/${pkgname}/"
license=('GPL3')
depends=('git' 'openssl-1.0')
makedepends=('libxslt')
conflicts=("${pkgname}-git")
source=("https://github.com/AGWA/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5150144a528bc74eeb47a2884cf2fefe978a1d1dc0223bbfcac395fa6a73a410')

build() {
    cd "${pkgname}-${pkgver}"

    # https://github.com/AGWA/git-crypt/issues/111
    export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
    export CXXFLAGS+=" -I/usr/include/openssl-1.0"
    export LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl"

    make ENABLE_MAN=yes PREFIX=/usr
}

package() {
    cd "${pkgname}-${pkgver}"

    # https://github.com/AGWA/git-crypt/issues/111
    export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
    export CXXFLAGS+=" -I/usr/include/openssl-1.0"
    export LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl"

    make ENABLE_MAN=yes PREFIX=/usr DESTDIR="${pkgdir}" install
}
