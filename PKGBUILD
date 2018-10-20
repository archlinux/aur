# Maintainer: Nicolas Iooss <nicolas.iooss_aur at m4x.org>

pkgname=isoquery
pkgver=3.2.3
pkgrel=1
pkgdesc="Search and display ISO codes for countries, languages, currencies, and scripts."
arch=('i686' 'x86_64')
url="https://github.com/toddy15/isoquery"
license=('GPL3')
depends=('iso-codes' 'json-glib')
makedepends=('gettext' 'po4a' 'python-docutils')
source=("$pkgname-$pkgver.tar.gz::https://github.com/toddy15/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('56b451904566b741bdea2632c9c45e595fc16b6a1e9b3859b313faee76eaa621')

prepare() {
    cd "$pkgname-$pkgver"

    # Use en_US locale instead of C.UTF-8 to fix a test
    # https://github.com/toddy15/isoquery/issues/3
    sed -e 's/C\.UTF-8/en_US\.UTF-8/' -i tests/integration.c
}

build() {
    cd "$pkgname-$pkgver"

    ./configure --prefix=/usr
    make
}

check() {
    cd "$pkgname-$pkgver"

    make check
}

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install
}
