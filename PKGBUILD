# Maintainer: desbma
pkgname=debmirror
pkgver=2.34
pkgrel=1
pkgdesc='Debian partial mirror script, with ftp and package pool support'
url="https://salsa.debian.org/debian/${pkgname}"
arch=('any')
license=('GPL')
# see https://packages.debian.org/fr/sid/debmirror
depends=('bzip2' 'perl-lockfile-simple' 'perl-libwww' 'rsync')
optdepends=('diffutils' 'ed' 'gnupg' 'patch')
source=("https://mirrors.edge.kernel.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha512sums=('9dbf03d3e75553ec578e8d175cb58c30152208409347db020a2592796238162f030933d0bb306a2edfb4e1c4473a74bc15b7ecb85589f57aa5a80dc788399ccc')

build() {
    cd "${srcdir}/work"
    make all
}

check() {
    cd "${srcdir}/work"
    make check
}

package() {
    cd "${srcdir}/work"

    # see https://packages.debian.org/fr/sid/all/debmirror/filelist
    install -Dm 755 debmirror ${pkgdir}/usr/bin/debmirror
    install -Dm 644 TODO ${pkgdir}/usr/share/doc/${pkgname}/TODO
    install -Dm 644 examples/debmirror.conf ${pkgdir}/usr/share/doc/${pkgname}/examples/debmirror.conf
    install -Dm 755 mirror-size ${pkgdir}/usr/lib/${pkgname}/mirror-size
    install -Dm 644 debmirror.1 ${pkgdir}/usr/share/man/man1/debmirror.1
}
