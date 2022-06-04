# Maintainer: Beini <bane at iki dot fi>
pkgname=perl-mail-mboxparser
pkgver=0.55
pkgrel=1
pkgdesc='Module for working with UNIX-flavoured mailboxes'
_dist=Mail-MboxParser
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-mime-tools')
optdepends=('perl-mail-mbox-messageparser'
            'perl-uri-find: If you want to use Mail::MboxParser::Mail::Body->extract_urls')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/V/VP/VPARSEVAL/$_dist-$pkgver.tar.gz"
        "perl-Mail-MboxParser-0.55-Fix-garbled-attachment-name-RT-66576.patch")
sha256sums=('33f025e9b10956b9a58ef01774b92b790aacca5fb00b1c755ada77ad4e5c7d3b'
            'c0d0f6f6da5324dabe66a0cd37f304ce7b222c0644b434367647e1c37d1fa404')

prepare() {
  cd "$srcdir/$_dist-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/perl-Mail-MboxParser-0.55-Fix-garbled-attachment-name-RT-66576.patch"
}


build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
