# Maintainer: desbma
pkgname=debmirror
pkgver=2.37
pkgrel=1
pkgdesc='Debian partial mirror script, with ftp and package pool support'
url="https://salsa.debian.org/debian/${pkgname}"
arch=('any')
license=('GPL')
# see https://packages.debian.org/fr/sid/debmirror
depends=('bzip2' 'perl-lockfile-simple' 'perl-libwww' 'rsync')
optdepends=('diffutils' 'ed' 'gnupg' 'patch')
makedepends=('pod2man')
source=("https://salsa.debian.org/debian/${pkgname}/-/archive/debian/1%25${pkgver}/${pkgname}-debian-1%25${pkgver}.tar.bz2")
sha512sums=('cdca294e0f689e6dc3020bcba35870a35924263e541c8cbf9076efe277e02d2fc0b15e02938e2736939e9dadf326f960f165ecc303c51a2718296621ecc85287')

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
