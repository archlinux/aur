# Maintainer: fbabetto

pkgname=perl-template-plugin-multimarkdown
pkgver=0.12
pkgrel=1
pkgdesc="MultiMarkdown plugin for Template-Toolkit"
_dist="Template-Plugin-MultiMarkdown"
arch=('any')
#url="https://metacpan.org/pod/Template::Plugin::MultiMarkdown"
url="http://search.cpan.org/dist/Template-Plugin-MultiMarkdown/"
license=('PerlArtistic')
depends=('perl' 'perl-template-toolkit' 'perl-text-multimarkdown')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
optdepends=('perl-text-multimarkdown-xs')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/B/BA/BARBIE/$_dist-$pkgver.tar.gz)
md5sums=('085fb3110599df5243eab4e884874a65')

# perl-io is in perl, perl-plugin-filter is in perl-template-toolkit,
# perl test-more is in perl-test-simple which is in perl,
# idem for perl-cpan-meta, perl-test-cpan-meta-json,
# perl-test-pod and perl-test-pod-coverage

build() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make test
}

package() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make DESTDIR="$pkgdir/" install
}
