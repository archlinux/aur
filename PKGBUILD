# First Linux Arch packager: Serge Victor <arch@random.re>

# toplip
#
# Feature Highlights
# -  Very strong encryption (XTS-AES256 based, possibly cascaded)
# -  Optional "plausible deniability"
# -  Optional image embedding/extraction (PNG/JPG)
# -  Optional multiple passphrase protection
# -  Simplified brute force recovery protection
# -  No identifiable output markers
# -  Open source/GPLv3
# -  Commercial support/training

pkgname=toplip
_pkgname=HeavyThing
pkgver=1.13
pkgrel=1
pkgdesc="Command line encryption and decryption utility with optional plausible deniability, image embedding, and multiple/variable passphrase complexity"
arch=('x86_64')
url="https://2ton.com.au/toplip/"
license=('GPL3')
makedepends=('fasm')
source=(https://2ton.com.au/$_pkgname-$pkgver.tar.gz)
md5sums=('068ddcbafbc5185f7d6710a6c6b735df')
_fasm="fasm -m 262144"

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    $_fasm $pkgname/$pkgname.asm
    ld -o $pkgname/$pkgname $pkgname/$pkgname.o
}

package() {
    mkdir -p $pkgdir/usr/bin
    cd "$srcdir/$_pkgname-$pkgver"
    install -m755 $pkgname/$pkgname $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:
