# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-x11-xcb
_cpanname=X11-XCB
pkgver=0.21
pkgrel=1.0
pkgdesc="Perl bindings for libxcb"
arch=('i686' 'x86_64')
url="http://metacpan.org/release/$_cpanname"
license=('PerlArtistic')
makedepends=('perl-xs-object-magic' 'perl-extutils-depends' 'libpthread-stubs' 'python'
	     'perl-module-install' 'perl-extutils-pkgconfig' 'perl-data-dump'
	     'perl-xml-simple' 'perl-xml-descent')
depends=('libxau' 'libxdmcp' 'perl-mouse' 'perl-mousex-nativetraits' 'perl-try-tiny'
		'libxcb' 'xcb-util' 'xcb-util-wm')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/Z/ZH/ZHMYLOVE/${_cpanname}-${pkgver}.tar.gz")
md5sums=('6d7a6a28cea0abcc9b699dda82a6d456')
sha512sums=('e87a64fd9e304949049f3c78e37941a38108d9061e7b822d9f35129cc22d59c0a2347ef1ae728a0e3e4b70a9d14a826e7f66df2e1a5f51e5b43303bf891d239b')

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
