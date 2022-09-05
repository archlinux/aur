# Maintainer: Radek Podgorny <radek@podgorny.cz>
# Contributorr: David Bailey <david.bailey@archlinux.net>

pkgname=cpuminer-git
pkgver=2.5.1.r13.g5f02105
pkgrel=1
pkgdesc="CPU miner for Litecoin and Bitcoin"
arch=("x86_64" "aarch64")
url="https://bitcointalk.org/index.php?topic=55038.0"
depends=("curl" "jansson")
makedepends=("git")
conflicts=("cpuminer")
provides=("cpuminer")
license=("GPL")
source=("git+https://github.com/pooler/cpuminer")
sha256sums=('SKIP')

pkgver(){
    cd "${srcdir}/cpuminer"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    cd "${srcdir}/cpuminer"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/libexec \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --runstatedir=/run
    make
}
package(){
    cd "${srcdir}/cpuminer"
    make DESTDIR="${pkgdir}" install
}
