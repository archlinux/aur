# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=mcabber-module-disco-hg
pkgver=r63.d644c08bbc27
pkgrel=1
pkgdesc="mcabber module to send service discovery requests"
arch=('i386' 'x86_64')
url="https://isbear.org.ua/hg/isbear/mcabber-disco/"
license=('GPL2')
depends=('mcabber')
makedepends=('mercurial' 'cmake')
source=("${pkgname}::hg+https://isbear.org.ua/hg/isbear/mcabber-disco/")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir/" install
}
