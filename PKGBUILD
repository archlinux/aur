# Maintainer: Prurigro
# Contributor: Erik Weber <mail at erikweber dot org>

pkgname=rename
pkgver=1.3
pkgrel=7
pkgdesc="Fast file renaming utility with support for string, regex and case"
url="http://fossies.org/linux/privat/old/"
license=('GPL')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('glibc')
install="${pkgname}.install"
source=("http://fossies.org/linux/privat/old/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.c.patch")
sha512sums=('7959ef0417d02aecd23200fbc226acd0cc34595d16efdb931657c2292ec2a0b9ff794406b6baa5234db5c95b1eae8a1dcf1862936a40e66bb70710154c89e5dd'
            'e418b416aac441f6d290b2f076fbc9c5de2f6cf8378241ea0e0271c3bdc4e317e80a0da2fb09797936de2823de6677e4ef1744bedf66f499c7c7c7144668e497')

prepare() {
    cd ${pkgname}-${pkgver}
    patch -p1 < ../rename.c.patch
}

build() {
    unset CPPFLAGS

    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 rename "${pkgdir}/usr/bin/renamexm"
    install -Dm644 rename.1 "${pkgdir}/usr/share/man/man1/renamexm.1"
}
