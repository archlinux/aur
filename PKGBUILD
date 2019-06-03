# Maintainer: desbma
pkgname=debmirror
pkgver=2.32
pkgrel=1
pkgdesc='Debian partial mirror script, with ftp and package pool support'
url="https://salsa.debian.org/debian/${pkgname}"
arch=('any')
license=('GPL')
# see https://packages.debian.org/fr/sid/debmirror
depends=('bzip2' 'perl-lockfile-simple' 'perl-libwww' 'rsync')
optdepends=('diffutils' 'ed' 'gnupg' 'patch')
source=("https://mirrors.edge.kernel.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha512sums=('1f1343ee3ae955b73b4dc90a978f4489e5471dc27b73a0e4bf7f0aec1015b0aecc70e704d581f3a926f739c5296fe96225ec4cdafe59f3acc8139a0f880530d4')

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
