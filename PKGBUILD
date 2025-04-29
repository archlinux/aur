# Maintainer: devome <evinedeng@hotmail.com>
# Contributer: desbma

_cpanname=LockFile-Simple
pkgname="perl-${_cpanname,,}"
pkgver=0.208
pkgrel=3
pkgdesc="Perl/CPAN Module Crypt::Simple - simple file locking scheme"
url="https://metacpan.org/dist/LockFile-Simple"
license=("GPL-2.0-or-later or PerlArtistic")
arch=("any")
depends=("perl")
source=("https://cpan.metacpan.org/authors/id/S/SC/SCHWIGON/${pkgname#perl-}/${_cpanname}-${pkgver}.tar.gz")
sha256sums=('45c77896b2a5a0a45f6202a6f813f437ff8b283f84a1c60d0c4f3730802af3a2')

build() {
    cd "${_cpanname}-${pkgver}"

    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make
}

package() {
    cd "${_cpanname}-${pkgver}"

    make pure_install doc_install DESTDIR="${pkgdir}"

    find "${pkgdir}" -name ".packlist" -delete
    find "${pkgdir}" -name "*.pod" -delete
}
