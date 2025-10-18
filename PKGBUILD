# Maintainer: Florian Pritz <flo@xinu.at>
# Grabbed from Parabola by figue <https://aur.archlinux.org/account/figue> :: https://www.parabola.nu/packages/pcr/x86_64/perl-file-rename/

pkgname=perl-file-rename
pkgver=2.02
pkgrel=1
pkgdesc="Renames multiple files using Perl regular expressions."
arch=(any)
url="https://metacpan.org/release/File-Rename"
license=(PerlArtistic)
depends=(perl)
provides=('perl-rename')
conflicts=('perl-rename')
options=(!emptydirs)
source=(https://cpan.metacpan.org/authors/id/R/RM/RMBARKER/File-Rename-$pkgver.tar.gz)
sha256sums=('537b608008b68136dae0b8bd1afe5eab75264bb64bb17839ee65bdb474c520df')

build() {
    cd "$srcdir/File-Rename-$pkgver"

    perl Makefile.PL PREFIX=/usr INSTALLDIRS=vendor
    make
}

package() {
    cd "$srcdir/File-Rename-$pkgver"

    make DESTDIR="$pkgdir/" install
    install -d "$pkgdir/usr/bin/"
    ln -s vendor_perl/rename "$pkgdir/usr/bin/perl-rename"
    ln -s /usr/share/man/man1/rename.1p.gz "$pkgdir/usr/share/man/man1/perl-rename.1p.gz"
}
