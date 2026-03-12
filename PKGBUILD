# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164
# Maintainer: Toria <ninetailedtori@uwu.gal>

_pkgname=cryptmount
pkgname=("${_pkgname}-git")
pkgver=6.3.5.r0.g8281ab9
pkgrel=1
depends=('libgcrypt' 'device-mapper' 'util-linux' 'autoconf')
makedepends=('git')
pkgdesc='Simplified management of Linux encrypted filesystems (git vcs).'
arch=('i686' 'x86_64')
url="https://github.com/rwpenney/${_pkgname}"
license=('GPL')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd          "${srcdir}/${_pkgname}"
    git         describe --long --abbrev=7 --tags | \
    sed         's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd          "${srcdir}/${_pkgname}"
    echo        -e "\033[31;1mFATAL BUG: \033[0mBROKEN AS OF CURRENTLY, DO NOT INSTALL. THE --with-systemd OPTION ATTEMPTS TO OVERWRITE /lib DUE TO INVALID RULES UPSTREAM."
    exit        1
    autoreconf  -vi
    ./configure --prefix=/usr --libdir=/usr/lib --sbindir=/usr/bin --sysconfdir=/etc --datarootdir=/usr/share --with-systemd
}

build() {
    cd          "${srcdir}/${_pkgname}"
    make
}

package() {
    cd          "${srcdir}/${_pkgname}"
    make        install DESTDIR="${pkgdir}" PREFIX="/usr"
}
