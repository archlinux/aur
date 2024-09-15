# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Max Pray a.k.a. <synthead@gmail.com>
# Contributor: Pranay Kanwar <pranay.kanwar@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-net-libdnet
_cpanname="Net-Libdnet"
pkgver=0.99
pkgrel=3.4
pkgdesc="Binding for Dug Song's libdnet"
arch=('i686' 'x86_64')
url="https://metacpan.org/release/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl-class-gomor' 'libdnet')
makedepends=('perl-extutils-makemaker')
options=('!emptydirs')
source=("http://www.cpan.org/authors/id/G/GO/GOMOR/${_cpanname}-${pkgver}.tar.gz" lengths.patch)
md5sums=('c838677154b730f47f9a5c6b679fe296')
sha512sums=('fe62a7f59cf752fb6dd05233b83773ecd98db4b5cce447ba6c8fdbe4a173a061487003274eaf3ee6c1da5dc6a9da55f10ba021cb5b2140b673fa7bcd91a2f0c5')

prepare() {
  cd $_cpanname-$pkgver
  patch -Np2 -b -z .orig<../lengths.patch
}

build() {
  cd $_cpanname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_cpanname-$pkgver"
  make test
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
  cd $_cpanname-$pkgver
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
  _perl_depends
}

# vim:set ts=2 sw=2 et:
md5sums=('c838677154b730f47f9a5c6b679fe296'
         '56d0c7d57dee56d7f2232e1ba13ac7f3')
sha512sums=('fe62a7f59cf752fb6dd05233b83773ecd98db4b5cce447ba6c8fdbe4a173a061487003274eaf3ee6c1da5dc6a9da55f10ba021cb5b2140b673fa7bcd91a2f0c5'
            '4e90c52275114ef68e3972fba56ef147dbcc21302cf49969aaf88f9ac1b3395ba44f8f801b54054598f958bf0f8760d3205f939793a209d63f82547de8c63084')
