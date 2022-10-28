# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=opkg
pkgver=0.6.0
pkgrel=1
pkgdesc="Opkg is a lightweight package management system based upon ipkg"
arch=('i386' 'x86_64')
url="https://code.google.com/archive/p/opkg/"
license=('GPL')
depends=('curl' 'libarchive' 'gpgme' 'libsolv>=0.7.14')
source=("http://downloads.yoctoproject.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('56844722eff237daf14aa6e681436f3245213c5590ed0cda37a79df637ff3a4c')

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
