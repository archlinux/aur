# Maintainer: Artem Senichev <artemsen@gmail.com>

_pkgname=xvi
pkgname="${_pkgname}-git"
pkgver=1
pkgrel=1
pkgdesc='Hex editor with ncurses based user interface'
arch=('x86_64')
license=('MIT')
makedepends=('cargo' 'rust' 'git')
depends=('ncurses')
url='https://github.com/artemsen/xvi'
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long --always | sed 's/-g.*//;s/^v//;s/-/./'
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -D -m 755 target/release/xvi "${pkgdir}/usr/bin/xvi"
    mkdir -p "${pkgdir}/usr/share/man/man1" "${pkgdir}/usr/share/man/man5"
    gzip -c extra/xvi.1 > "${pkgdir}/usr/share/man/man1/xvi.1.gz"
    gzip -c extra/xvirc.5 > "${pkgdir}/usr/share/man/man5/xvirc.5.gz"
}
