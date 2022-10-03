# Maintainer: desbma
pkgname=debmirror
pkgver=2.36
pkgrel=2
pkgdesc='Debian partial mirror script, with ftp and package pool support'
url="https://salsa.debian.org/debian/${pkgname}"
arch=('any')
license=('GPL')
# see https://packages.debian.org/fr/sid/debmirror
depends=('bzip2' 'perl-lockfile-simple' 'perl-libwww' 'rsync')
optdepends=('diffutils' 'ed' 'gnupg' 'patch')
makedepends=('pod2man')
source=("https://mirrors.edge.kernel.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha512sums=('fc9c6e83a919b28df3e222b3991844da8e362fe1d0f6ab353fc7fee70313de7568f3558ca11db2fb83b711dccea9e3c9dcc0a41446e9fbeceba7cfeb9c65a038')

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
