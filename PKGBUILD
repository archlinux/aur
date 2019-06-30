# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: ezzetabi <ezzetabi@gawab.com>
# Contributor: Sebastian Schwarz <seschwar@gmail.com>

pkgname=mirage2iso
pkgver=0.4.2
pkgrel=1
pkgdesc="libmirage-based CD/DVD image file converter"
arch=(i686 x86_64)
url=https://bitbucket.org/mgorny/mirage2iso
license=(custom:BSD3)
depends=(libassuan libmirage)
source=("https://github.com/mgorny/mirage2iso/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "https://github.com/mgorny/mirage2iso/releases/download/v${pkgver}/${pkgname}-${pkgver}-tests.tar.xz")
noextract=(${pkgname}-${pkgver}-tests.tar.xz)
md5sums=('e4e38aa47cbc63211c882f2ce8f62cd0'
         '0747a2db102ab5aaa35356ec2328442e')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}-tests.tar.xz" --strip-components 1
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -k check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
}
