# CPAN Name  : Clipboard
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-clipboard
pkgver=0.28
pkgrel=1
pkgdesc='Perl clipboard module'
arch=('any')
url='https://metacpan.org/release/Clipboard'
license=('PerlArtistic' 'GPL')
makedepends=('perl-module-build>=0.28')
depends=('perl-cgi' 'perl-uri' 'xclip')
source=(http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Clipboard-0.28.tar.gz)
options=(!emptydirs)
md5sums=('fcd645045894ebac18e1aec630d2a489')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Clipboard-0.28
	sanitize
	/usr/bin/perl Build.PL --installdirs vendor --destdir "$pkgdir"
	/usr/bin/perl Build
}

check() {
	cd Clipboard-0.28
	sanitize
	/usr/bin/perl Build test
}

package() {
	cd Clipboard-0.28
	sanitize
	/usr/bin/perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
