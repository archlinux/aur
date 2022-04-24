# Maintainer: Raf Gemmail <rafiq+aur@dreamthought.com>

pkgname=rakubrew
pkgver=28
pkgrel=2
pkgdesc='Manage Raku (Formarly Perl 6+) installations in your HOME folder'
arch=('any')
url="https://rakubrew.org/"
license=('MIT')
depends=('perl' 'perl-capture-tiny' 'perl-cpan-perl-releases' 'perl-devel-patchperl'
         'perl-file-path-tiny' 'perl-local-lib' 'perl-file-homedir' 'perl-http-tinyish'
         'perl-json' 'perl-file-copy-recursive')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-exception' 'perl-test-output' 'perl-test-spec'
              'perl-path-class' 'perl-io-all')
options=('!emptydirs')
source=("v$pkgver.tar.gz::https://codeload.github.com/Raku/App-Rakubrew/tar.gz/refs/tags/v28")
sha512sums=('ebea2101384e2ff7495e7be682e9b425a946999bc30694f7ce7b8a5a5d323c52b47cd0c0beac506d5bca4c76a70edd9706a07bec0d7f5399ecac8a0cf46a143d')

build() {
  cd App-Rakubrew-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  perl Makefile.PL PREFIX="$pkgdir/usr"
  make
}

package() {
  cd App-Rakubrew-$pkgver
  make install
  install -d "${pkgdir}/usr"
  install -d "${pkgdir}/usr/bin"
  install -m555 "${srcdir}/App-Rakubrew-${pkgver}/script/rakubrew" "${pkgdir}/usr/bin"
  install -Dm0644 "${srcdir}/App-Rakubrew-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
