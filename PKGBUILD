# Contributor: Christopher Arndt <chris@chrisarndt.de>
# Contributor: Luis Pablo Gasparotto <lpgasparotto at gmail dot com>
# Contributor: Phillip Fynan <pfynan@gmail.com>
# Maintainer: Peter Sutton <foxxy@foxdogstudios.com>

_pkgver_year=2015
_pkgver_month=04
_pkgver_day=17

pkgname=abcmidi
pkgver="${_pkgver_year}${_pkgver_month}${_pkgver_day}"
pkgrel=1
pkgdesc="A set of tools for converting ABC files to MIDI files and vice versa, as well as other small utilities"
url="http://abc.sourceforge.net/abcMIDI/"
license=('GPL')
depends=('glibc')
makedepends=('unzip')
changelog=ChangeLog
source=("http://ifdo.pugmarks.com/~seymour/runabc/abcMIDI-${_pkgver_year}-${_pkgver_month}-${_pkgver_day}.zip")
arch=(i686 x86_64)
sha256sums=('764a5ff1d0d6de5289156b76028b025d2f03b8d7bfaeb459c71b82b04cdb0682')

build() {
    cd $srcdir/abcmidi
    make 'binaries=abc2midi midi2abc abc2abc mftext midicopy abcmatch'
}

package() {
    cd $srcdir/abcmidi
    mkdir -p $pkgdir/usr/bin
    make prefix=$pkgdir/usr 'binaries=abc2midi midi2abc abc2abc mftext midicopy abcmatch' install
    # install programming documentation to docdir
    install -m 755 -d $pkgdir/usr/share/doc/$pkgname/programming
    install -m 644 doc/programming/*.txt doc/programming/*.abc \
        $pkgdir/usr/share/doc/$pkgname/programming
    # install example ABC files to docdir
    install -m 755 -d $pkgdir/usr/share/doc/$pkgname/samples
    install -m 644 samples/*.abc $pkgdir/usr/share/doc/$pkgname/samples
}

