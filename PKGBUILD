# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=debmirror
pkgver=2.38
pkgrel=1
pkgdesc='Debian partial mirror script, with ftp and package pool support'
url="https://salsa.debian.org/debian/${pkgname}"
arch=('any')
license=('GPL2')
# see https://packages.debian.org/fr/sid/debmirror
depends=('bzip2' 'perl-lockfile-simple' 'perl-libwww' 'rsync' 'xz')
optdepends=('diffutils' 'ed' 'gnupg' 'patch')
makedepends=('pod2man')
source=("https://salsa.debian.org/debian/${pkgname}/-/archive/debian/1%25${pkgver}/${pkgname}-debian-1%25${pkgver}.tar.bz2")
sha512sums=('8884a209be0b6210e78c3353cb4b6f8a679284fa9f706fa00f9de443e82caef0c054520220737f71a2982d9bb00396883ebae8009a0c04d8c6d735fc91bd67b3')

build() {
    cd "${srcdir}/${pkgname}-debian-1%${pkgver}"
    make all
}

check() {
    cd "${srcdir}/${pkgname}-debian-1%${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-debian-1%${pkgver}"

    # see https://packages.debian.org/fr/sid/all/debmirror/filelist
    install -Dm 755 debmirror ${pkgdir}/usr/bin/debmirror
    install -Dm 644 TODO ${pkgdir}/usr/share/doc/${pkgname}/TODO
    install -Dm 644 examples/debmirror.conf ${pkgdir}/usr/share/doc/${pkgname}/examples/debmirror.conf
    install -Dm 755 mirror-size ${pkgdir}/usr/lib/${pkgname}/mirror-size
    install -Dm 644 debmirror.1 ${pkgdir}/usr/share/man/man1/debmirror.1
}
