# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>
# Contributor: fbabetto

pkgname='perl-text-multimarkdown'
_module='Text-MultiMarkdown'
_author='B/BD/BDFOY'
pkgver='1.001'
pkgrel='1'
pkgdesc='Convert MultiMarkdown syntax to (X)HTML.'
arch=('any')
url="https://metacpan.org/dist/$_module"
license=('BSD')
depends=('perl-text-markdown' 'perl-html-parser')
makedepends=('perl-list-moreutils' 'perl-module-install')
checkdepends=('perl-test-exception' 'perl-test-pod' 'perl-test-pod-coverage' 'perl-text-diff')
source=("https://cpan.metacpan.org/authors/id/$_author/$_module-$pkgver.tar.gz")
sha256sums=('501d44ac7da5494499cea851e9b2fb52538080b0c1e936230c8c26d67e048433')

build() {
   (
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'
      cd "$_module-$pkgver"
      perl Makefile.PL INSTALLDIRS='vendor'
      make
   )
}

check() {
   (
      cd "$_module-$pkgver"
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      export PERL_MM_USE_DEFAULT='1'
      make test
   )
}

package() {
   (
      cd "$_module-$pkgver"
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      make install INSTALLDIRS='vendor' DESTDIR="$pkgdir"
      install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
      find "$pkgdir" -name .packlist     -delete
      find "$pkgdir" -name perllocal.pod -delete
      find "$pkgdir" -type d -empty      -delete
   )
}

#:indentSize=3:tabSize=3:noTabs=true:mode=shellscript:maxLineLen=87:
