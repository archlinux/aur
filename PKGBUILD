# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=opkg
pkgver=0.3.3
pkgrel=1
pkgdesc="Opkg is a lightweight package management system based upon ipkg"
arch=('i386' 'x86_64')
url="https://code.google.com/archive/p/opkg/"
license=('GPL')
depends=('curl' 'libarchive' 'gpgme' 'libsolv')
source=("http://downloads.yoctoproject.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'autogen.sh')
sha256sums=('19db9e73121a5e4c91fa228b0a6a4c55cc3591056130cfb3c66c30aa32f8d00e'
            '72d2b5491458f0fb5fabaa5bb65482fe1fb256b39cef258029116872ed34dbe2')

prepare() {
    # This is stripped out of releases, but the provided configure script
    # doesn't work out-of-the-box on Arch
    ln -sf ../autogen.sh "${srcdir}/${pkgname}-${pkgver}/autogen.sh"
}

build() {
    cd ${pkgname}-${pkgver}

    ./autogen.sh
    ./configure --prefix=/usr --with-libsolv
    make
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR="${pkgdir}/" install
}
