pkgname='perl-test-use-ok'
_realname='Test-use-ok'
pkgver='0.11'
pkgrel=2
pkgdesc="Alternative to Test::More::use_ok"
arch=('any')
license=('perl')
url="http://search.cpan.org/~audreyt/Test-use-ok"
options=(!emptydirs)

depends=('perl>=5.8.9')

provides=('test-use-ok=0.11' 'ok=0.11' 'perl-ok=0.11' 'Test::use::ok=0.11' 'perl-test-use-ok=0.11')

source=('http://search.cpan.org/CPAN/authors/id/A/AU/AUDREYT/Test-use-ok-0.11.tar.gz')
md5sums=('014364cc2f0df651d8416ebb60451f18')

build() {
cd "$_realname-$pkgver"
# install module in vendor directories.
export PERL_MM_USE_DEFAULT=1
perl Makefile.PL
make
}
package() {
cd "$_realname-$pkgver"
make install INSTALLDIRS=vendor DESTDIR=${pkgdir}

# remove perllocal.pod and .packlist
find ${pkgdir} -name perllocal.pod -delete
find ${pkgdir} -name .packlist -delete
}
