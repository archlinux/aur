# CPAN Name  : Clipboard
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-clipboard
pkgver=0.24
pkgrel=1
pkgdesc='Perl clipboard module'
arch=('any')
url='https://metacpan.org/release/Clipboard'
license=('PerlArtistic' 'GPL')
makedepends=('perl-module-build>=0.28')
depends=('perl-cgi' 'perl-uri' 'xclip')
source=(http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Clipboard-0.24.tar.gz)
options=(!emptydirs)
md5sums=('665a4b11c8aebe1fcbca4c2d5712ba9d')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Clipboard-0.24
	sanitize
	/usr/bin/perl Build.PL --installdirs vendor --destdir "$pkgdir"
	/usr/bin/perl Build
}

check() {
	cd Clipboard-0.24
	sanitize
	/usr/bin/perl Build test
}

package() {
	cd Clipboard-0.24
	sanitize
	/usr/bin/perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
