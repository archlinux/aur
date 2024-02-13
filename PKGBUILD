# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

_distname='Hash-Util-FieldHash-Compat'
pkgname='perl-hash-util-fieldhash-compat'
pkgver='0.11'
pkgrel='1'
pkgdesc="Use Hash::Util::FieldHash or ties, depending on availability"
arch=('any')
license=('LicenseRef-GPL-1.0-or-later OR Artistic-1.0-Perl')
options=('!emptydirs')
depends=('perl')
url="https://metacpan.org/release/$_distname"
_author='ETHER'
_licensefilename_SPDX_GPL1='GPL-1.0-or-later.txt'
source=("https://search.cpan.org/CPAN/authors/id/${_author::1}/${_author::2}/$_author/$_distname-$pkgver.tar.gz"
        "${_distname}-LICENCE-${_licensefilename_SPDX_GPL1}::https://raw.githubusercontent.com/Perl/perl5/perl-5.10.0/Copying")
sha512sums=('a38397ba17587d85ed88020c85bd4d7c36798a9e8fa46490017ea84d30c6541f32a621a9ef585d57dbb49f39791d5644f329e956d4be9e0ec01918eb782eae9c'
            'f3e5cce80bb15147bcb998320e670d2e04ae9cef0425181c4123471b781c6f56bd8b3e71fef2d6ab0f02b5fb8591d7ecb26ddc09ba3d2fb2f9ef7a538f4ac998')
_distdir="$_distname-$pkgver"

prepare() {
  cd "$srcdir/$_distdir"

  echo "Preparing license resources..."
  cp --verbose "../$_distname-LICENCE-$_licensefilename_SPDX_GPL1" "LICENCE-$_licensefilename_SPDX_GPL1"
}

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete

  install -Dm644 LICENCE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
