# Contributor: Christopher Arndt <chris@chrisarndt.de>
# Contributor: Luis Pablo Gasparotto <lpgasparotto at gmail dot com>
# Contributor: Phillip Fynan <pfynan@gmail.com>
# Maintainer: Peter Sutton <foxxy@foxdogstudios.com>

_pkgver_year=2017
_pkgver_month=02
_pkgver_day=02

pkgname=abcmidi
pkgver="${_pkgver_year}${_pkgver_month}${_pkgver_day}"
pkgrel=1
pkgdesc="A set of tools for converting ABC files to MIDI files and vice versa, as well as other small utilities"
url="http://abc.sourceforge.net/abcMIDI/"
license=('GPL')
depends=()
makedepends=()
changelog=ChangeLog
source=("https://github.com/leesavide/abcmidi/archive/abcMIDI-${_pkgver_year}.${_pkgver_month}.${_pkgver_day}.tar.gz")
arch=(i686 x86_64)
sha256sums=('cd2b5caa9971ae8ea666cb2be16029a73b9f4463847dd2db2cca202f1f934af2')

_srcdir=abcmidi-abcMIDI-${_pkgver_year}.${_pkgver_month}.${_pkgver_day}

build() {
    cd $srcdir/$_srcdir
    make 'binaries=abc2midi midi2abc abc2abc mftext midicopy abcmatch'
}

package() {
    cd $srcdir/$_srcdir
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

