# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=antares-git
pkgver=r113.g30e3525
pkgrel=1
pkgdesc='A window manager for X'
arch=(x86_64)
url='https://notabug.org/Leon_Plickat/antares'
license=(GPL3)
depends=(cairo libxinerama)
makedepends=(git)
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-*}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname%-*}"

    if [ -e $startdir/config.h ]; then
        msg2 "using custom config.h"
        cp ${startdir}/config.h src/config.h
    else
        msg2 "using default config.h"
    fi
}

build() {
    cd "${pkgname%-*}"
    make
}

package() {
    cd "${pkgname%-*}"
    install -D -m 755 antares "$pkgdir"/usr/bin/antares
    install -D -m 644 doc/antares.1 "$pkgdir"/usr/share/man/man1/antares.1
}
