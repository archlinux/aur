# Maintainer: Dmitri Kourennyi <dkour at mykolab dot com>
# Contributor: Eric Schulte <[firstname] dot [lastname] at gmx dot com>
pkgname=feedgnuplot
pkgver=1.61
pkgrel=3
pkgdesc="Tool to plot realtime and stored data from the commandline, using gnuplot."
arch=('any')
url="https://github.com/dkogan/feedgnuplot"
license=('GPL')
depends=('perl' 'gnuplot' 'perl-list-moreutils' 'perl-string-shellquote')
provides=('feedgnuplot')
source=("https://github.com/dkogan/feedgnuplot/archive/v${pkgver}.tar.gz")
b2sums=("0fb3423b4353f5886b933c6137bf8c8a6c3b206c07b73aac157df0cdf99e05aa3095b7f01d72b531e1b1cfefaa5163d29727adf69a3d09bd161c6e4ac28219e9")

build() {
  cd "$srcdir/${pkgname}-${pkgver}" || exit

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}" || exit

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

  # Copy shell completions
  install -D --mode=644 --target-directory="$pkgdir/usr/share/bash-completion/completions/" completions/bash/feedgnuplot
  install -D --mode=644 --target-directory="$pkgdir/usr/share/zsh/site-functions/" completions/zsh/_feedgnuplot

  # Copy guide
  install --directory "$pkgdir/usr/share/doc/feedgnuplot"
  cp --recursive guide "$pkgdir/usr/share/doc/feedgnuplot/"

  # Copy License
  install -D --mode=644 --target-directory="$pkgdir/usr/share/licenses/feedgnuplot/" LICENSE
}
