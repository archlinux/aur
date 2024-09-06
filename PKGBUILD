# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=opkg
pkgver=0.7.0
pkgrel=1
pkgdesc="Opkg is a lightweight package management system based upon ipkg"
arch=('i386' 'x86_64')
url="https://git.yoctoproject.org/cgit/cgit.cgi/opkg"
license=('GPL')
depends=('curl' 'libarchive' 'gpgme' 'libsolv>=0.7.14')
source=("http://downloads.yoctoproject.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee26704bf8fe757c54567')

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
