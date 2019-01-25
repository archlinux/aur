# Maintainer: desbma
pkgname=debmirror
pkgver=2.30
pkgrel=1
pkgdesc='Debian partial mirror script, with ftp and package pool support'
url="https://salsa.debian.org/debian/${pkgname}"
arch=('any')
license=('GPL')
# see https://packages.debian.org/fr/sid/debmirror
depends=('bzip2' 'perl-lockfile-simple' 'perl-libwww' 'rsync')
optdepends=('diffutils' 'ed' 'gnupg' 'patch')
source=("https://mirrors.edge.kernel.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha512sums=('5b607e01e092e390805023542f8df87b9bc6d816c14ecb6799b0fa62ac5d1d1835206429d1df50d9854c10f17290299dce0b6a8357c3114e65865fee9ce0be24')

build() {
    cd "${srcdir}/${pkgname}"
    make all
}

check() {
    cd "${srcdir}/${pkgname}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}"

    # see https://packages.debian.org/fr/sid/all/debmirror/filelist
    install -Dm 755 debmirror ${pkgdir}/usr/bin/debmirror
    install -Dm 644 TODO ${pkgdir}/usr/share/doc/${pkgname}/TODO
    install -Dm 644 examples/debmirror.conf ${pkgdir}/usr/share/doc/${pkgname}/examples/debmirror.conf
    install -Dm 755 mirror-size ${pkgdir}/usr/lib/${pkgname}/mirror-size
    install -Dm 644 debmirror.1 ${pkgdir}/usr/share/man/man1/debmirror.1
}
