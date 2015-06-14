# Maintainer: Glennie Vignarajah <glennie@glennie.fr>

pkgname=file-rename
pkgver=0.20
pkgrel=1
pkgdesc="Renames multiple files using regular expressions."
arch=(any)
url="https://metacpan.org/release/File-Rename"
license=('PERL 5')
depends=(perl)
options=(!emptydirs)
source=(http://cpan.metacpan.org/authors/id/R/RM/RMBARKER/File-Rename-$pkgver.tar.gz)
md5sums=('c91d42b25294ac001bfb1391258daec5')

build() {
    cd "${srcdir}/File-Rename-${pkgver}"

    perl Makefile.PL PREFIX=/usr INSTALLDIRS=vendor
    make
}

package() {
    cd "${srcdir}/File-Rename-${pkgver}"

    make DESTDIR=${pkgdir}/ install
    install -d ${pkgdir}/usr/bin/
    mv ${pkgdir}/usr/bin/vendor_perl/rename ${pkgdir}/usr/bin/vendor_perl/file-rename
    mv ${pkgdir}/usr/share/man/man1/rename.1p ${pkgdir}/usr/share/man/man1/file-rename.1p 

    ln -s vendor_perl/file-rename "$pkgdir/usr/bin/file-rename"
    ln -s /usr/share/man/man1/file-rename.1p.gz "$pkgdir/usr/share/man/man1/file-rename.1p.gz"
}
