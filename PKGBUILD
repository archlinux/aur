# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=opkg
pkgver=0.3.6
pkgrel=1
pkgdesc="Opkg is a lightweight package management system based upon ipkg"
arch=('i386' 'x86_64')
url="https://code.google.com/archive/p/opkg/"
license=('GPL')
depends=('curl' 'libarchive' 'gpgme' 'libsolv>=0.6.28')
source=("http://downloads.yoctoproject.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f607f0e61be8cf8a3bbd0d2dccd9ec9e9b6c21dd4307b671c600d6eeaf84d30b')

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
