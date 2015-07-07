# Maintainer: William J. Bowman <aur@williamjbowman.com>
# Contributor: Rick Rein <jeebusroxors@gmail.com>

pkgname=perl-text-aspell
pkgver=0.09
pkgrel=2
pkgdesc="Perl interface to the GNU Aspell library"
url="http://search.cpan.org/~hank/Text-Aspell/"
license="GPL"
arch=('i686' 'x86_64')
options=('!emptydirs')
depends=('perl' 'aspell')
checkdepends=('aspell-en')
source=("http://search.cpan.org/CPAN/authors/id/H/HA/HANK/Text-Aspell-${pkgver}.tar.gz")
md5sums=('67ec8b9c4769969fa714fc25c9c73832')
sha256sums=('2bea3209f18e273b193e3175a42d269391919e49ab106b6e252395d272182f65')
sha512sums=('6e7f2a8f48f3d735d9162333c4d30a0ffcdc4a002cffc51f284759a1e89e0a79c0bf94e2af577f381613a114f1ede134f01db36367d443a81ba8d028a4a8c65b')

build() {
    cd "$srcdir/Text-Aspell-$pkgver"
    /usr/bin/perl Makefile.PL
    make
}

check() {
    cd "$srcdir/Text-Aspell-$pkgver"
    make test
}

package() {
    cd "$srcdir/Text-Aspell-$pkgver"
    make DESTDIR="$pkgdir" install

    /usr/bin/find "$pkgdir" -name '.packlist' -exec rm '{}' \;
    /usr/bin/find "$pkgdir" -name 'perllocal.pod' -exec rm '{}' \;
}
