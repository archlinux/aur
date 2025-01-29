# Maintainer: Dariusz Pelowski <dariusz pelowski gmail com>

pkgname=opkg
pkgver=0.8.0
pkgrel=1
pkgdesc="Opkg is a lightweight package management system based upon ipkg"
arch=('i386' 'x86_64')
url="https://git.yoctoproject.org/cgit/cgit.cgi/opkg"
license=('GPL')
depends=('curl' 'libarchive' 'gpgme' 'libsolv>=0.7.14')
source=("https://git.yoctoproject.org/opkg/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('def0d6e95b4106be074c0fce5a0caa0e8d737f21fe31fbeef1588597bad39666')

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
