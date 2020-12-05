# Maintainer: Petr Kutálek <petr@kutalek.cz>
pkgname=dynfwd
pkgver=git
pkgdesc='An unofficial secure and minimalistic DynFW client for Turris:Sentinel by CZ.NIC'
url='https://github.com/petrkutalek/dynfwd'
license=('MIT')

pkgrel=1
epoch=
arch=('i686' 'x86_64' 'arm')
depends=('ipset' 'zeromq' 'msgpack-c')
makedepends=('git')
source=(
    "$pkgname"::"git+https://github.com/petrkutalek/dynfwd.git"
    )
sha256sums=(
    'SKIP'
    )

pkgver () {
    cd "$pkgname"
    printf '%s' "$(git tag -l -n1 | cut -f1 -d' ' | cut -c 2-)"
}

prepare () {
    cd "$pkgname"
    git submodule init
    git submodule update
}

build () {
    cd "$pkgname/src"
    make
}

package () {
    cd "$pkgname/src"
    make DESTDIR="$pkgdir/usr" install
}
