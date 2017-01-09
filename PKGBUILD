# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=opkg
pkgver=0.3.4
pkgrel=1
pkgdesc="Opkg is a lightweight package management system based upon ipkg"
arch=('i386' 'x86_64')
url="https://code.google.com/archive/p/opkg/"
license=('GPL')
depends=('curl' 'libarchive' 'gpgme' 'libsolv')
source=("http://downloads.yoctoproject.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('750b900b53b62a9b280b601a196f02da81091eda2f3478c509512aa5a1ec93be')

build() {
    cd ${pkgname}-${pkgver}

    ./autogen.sh
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
