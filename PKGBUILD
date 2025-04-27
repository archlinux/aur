# Maintainer: devome <evinedeng@hotmail.com>
# Contributer: desbma

pkgname=debmirror
pkgver=2.43
pkgrel=1
pkgdesc='Debian partial mirror script, with ftp and package pool support'
url="https://salsa.debian.org/debian/${pkgname}"
arch=('any')
license=('GPL-2.0-or-later')
depends=('bzip2' 'perl-crypt-ssleay' 'perl-libwww' 'perl-lockfile-simple' 'rsync' 'xz')
optdepends=('ed' 'gnupg' 'patch')
source=("https://salsa.debian.org/debian/${pkgname}/-/archive/debian/1%25${pkgver}/${pkgname}-debian-1%25${pkgver}.tar.bz2")
sha256sums=('5cffe879be661578557a3b3f1bb3af785fb3e2c0bf53886cafbba173b03659e7')

build() {
    cd "${pkgname}-debian-1%${pkgver}"
    make all
}

check() {
    cd "${pkgname}-debian-1%${pkgver}"
    make check
}

package() {
    cd "${pkgname}-debian-1%${pkgver}"

    install -Dm 755 debmirror   "${pkgdir}/usr/bin/debmirror"
    install -Dm 644 TODO        "${pkgdir}/usr/share/doc/${pkgname}/TODO"
    install -Dm 644 examples/*  "${pkgdir}/usr/share/doc/${pkgname}/examples/debmirror.conf"
    install -Dm 644 mirror_size "${pkgdir}/usr/share/doc/${pkgname}/mirror_size"
    install -Dm 644 debmirror.1 "${pkgdir}/usr/share/man/man1/debmirror.1"
}
