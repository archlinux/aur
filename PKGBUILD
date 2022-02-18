# Maintainer: Raf Gemmail <rafiq+aur@dreamthought.com>

pkgname=rakubrew
pkgver=26
pkgrel=1
pkgdesc='Manage Raku (Formarly Perl 6+) installations in your $HOME'
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
source=("v$pkgver.tar.gz::https://codeload.github.com/Raku/App-Rakubrew/tar.gz/refs/tags/v${pkgver}")
sha512sums=('cf728b07e323fcf23a535fae54623275db0d7de822248b2e94d04fe5f2960dd0bcb2e3678dac6a4c2096da3fae753d01530fc39af9abf4e7ad8b9167dbc3adec')

build() {
  cd App-Rakubrew-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  perl Makefile.PL PREFIX=$pkgdir/usr
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
