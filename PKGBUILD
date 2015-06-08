# Contributor: Ben Webb <bjwebb67 at googlemail dot com>
pkgname=perl-dbix-contextualfetch
pkgver=1.03
pkgrel=1
pkgdesc="Add contextual fetches to DBI"
arch=(any)
url="http://search.cpan.org/~tmtm/DBIx-ContextualFetch-1.03/lib/DBIx/ContextualFetch.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-dbi')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/T/TM/TMTM/DBIx-ContextualFetch-$pkgver.tar.gz)
md5sums=('20a78432ae26b266216b7b30ff7941c3')

build() {
  cd "$srcdir/DBIx-ContextualFetch-$pkgver"

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
