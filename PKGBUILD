# Contributor: Christopher Arndt <chris@chrisarndt.de>
# Contributor: Luis Pablo Gasparotto <lpgasparotto at gmail dot com>
# Contributor: Phillip Fynan <pfynan@gmail.com>
# Maintainer: Peter Sutton <peter@foxdogstudios.com>

_pkgver_year=2023
_pkgver_month=11
_pkgver_day=01

pkgname=abcmidi
pkgver="$_pkgver_year$_pkgver_month$_pkgver_day"
pkgrel=1
pkgdesc='A set of tools for converting ABC files to MIDI files and vice versa, as well as other small utilities'
url='https://ifdo.ca/~seymour/runabc/top.html'
license=('GPL')
depends=('glibc')
makedepends=()
source=("https://ifdo.ca/~seymour/runabc/abcMIDI-${_pkgver_year}.${_pkgver_month}.${_pkgver_day}.zip")
arch=(x86_64)
sha256sums=('95d033f37f809c4687f130bb3e2f5523d6dd8bef467d51fb09eea4566bc95240')

build() {
    cd "$srcdir"/abcmidi
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir"/abcmidi

    make DESTDIR="$pkgdir/" install

    # Install programming documentation to docdir
    install -m 755 -d "$pkgdir"/usr/share/doc/$pkgname/programming

    install -m 644 doc/programming/*.txt doc/programming/*.abc \
                   "$pkgdir"/usr/share/doc/$pkgname/programming

    # Install example ABC files to docdir
    install -m 755 -d "$pkgdir"/usr/share/doc/$pkgname/samples
    install -m 644 samples/*.abc "$pkgdir"/usr/share/doc/$pkgname/samples
}
