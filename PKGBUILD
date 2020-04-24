# Maintainer: <clu>

pkgname=xpa
pkgver=2.1.20
pkgrel=1
epoch=
pkgdesc="A messaging system provides seamless communication between many kinds of Unix programs"
arch=('i686' 'x86_64')
url="http://hea-www.harvard.edu/RD/xpa/"
license=('MIT')
groups=()
depends=('tcl')
makedepends=('libxt')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/ericmandel/${pkgname}/archive/${pkgver}.tar.gz"
        'xpa_inc_fail.patch')
sha1sums=('bf361d03caec9c2c6cd3e02c5a5c0b668be1cc49'
          'c9e2a903b713a57016cab39139ca870f5b6bff94')
noextract=()

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    patch -p1 -i ${srcdir}/xpa_inc_fail.patch

    ./configure --prefix=/usr --enable-shared=link
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    mkdir -p ${pkgdir}/usr/bin
    make INSTALL_ROOT=${pkgdir} install
    mv ${pkgdir}/usr/{man,share/man}
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

