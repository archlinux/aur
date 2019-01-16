# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=opkg
pkgver=0.4.0
pkgrel=1
pkgdesc="Opkg is a lightweight package management system based upon ipkg"
arch=('i386' 'x86_64')
url="https://code.google.com/archive/p/opkg/"
license=('GPL')
depends=('curl' 'libarchive' 'gpgme' 'libsolv>=0.6.28')
source=("http://downloads.yoctoproject.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f6c00515d8a2ad8f6742a8e73830315d1983ed0459cba77c4d656cfc9e7fe6fe')

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
