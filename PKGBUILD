# Maintainer: Lucas Magalhães <whoisroot@national.shitposting.agency>
_pkgname=passivedns
pkgname=${_pkgname}-git
pkgver=r275.e126cbb
pkgrel=2
pkgdesc="A network sniffer that logs all DNS server replies for use in a passive DNS setup"
arch=('x86_64')
url="https://github.com/gamelinux/passivedns"
license=('GPLv2')
depends=('ldns' 'libpcap')
makedepends=('git' 'binutils') 
provides=("${_pkgname}")
source=("passivedns::git+git://github.com/gamelinux/passivedns.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgname}
    autoreconf --install
    ./configure
    make
}

package() {
    make install
}
