# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=opkg
pkgver=0.3.5
pkgrel=1
pkgdesc="Opkg is a lightweight package management system based upon ipkg"
arch=('i386' 'x86_64')
url="https://code.google.com/archive/p/opkg/"
license=('GPL')
depends=('curl' 'libarchive' 'gpgme' 'libsolv>=0.6.25')
source=("http://downloads.yoctoproject.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('734bc21dea11262113fa86b928d09812618b3966f352350cf916a6ae0d343f32')

build() {
    cd ${pkgname}-${pkgver}

    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-libsolv
    make
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR="${pkgdir}/" install
}
