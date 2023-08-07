# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-x11-xcb
_cpanname=X11-XCB
pkgver=0.19
pkgrel=1.3
pkgdesc="Perl bindings for libxcb"
arch=('i686' 'x86_64')
url="http://metacpan.org/release/$_cpanname"
license=('PerlArtistic')
makedepends=('perl-xs-object-magic' 'perl-extutils-depends' 'libpthread-stubs' 'python'
	     'perl-module-install' 'perl-extutils-pkgconfig' 'perl-data-dump'
	     'perl-xml-simple' 'perl-xml-descent')
depends=('libxau' 'libxdmcp' 'perl-mouse' 'perl-mousex-nativetraits' 'perl-try-tiny'
		'libxcb' 'xcb-util' 'xcb-util-wm')
checkdepends=('perl-test-more' 'perl-test-deep' 'perl-test-exception')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/M/MS/MSTPLBG/${_cpanname}-${pkgver}.tar.gz")
md5sums=('84856a9f0c9c807c2c76df09eebc3bfc')
sha512sums=('abd6369b00b9ebd4a333cd52b06b2f137a8b8c13a715a0ab485cf0f80acce601b8b22dfff394514ad8b21d253b5f72920aeee6b9bcf4b0d446b772d4ef60ce71')

build() {
  cd ${_cpanname}-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make || :
  make
}

_perl_depends() {
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}

package() {
  cd ${_cpanname}-${pkgver}
  make DESTDIR="$pkgdir" install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
  _perl_depends
}
