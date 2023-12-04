# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=Reply-Plugin-Prompt
pkgname=perl-reply-plugin-prompt
pkgver=0.0.21
pkgrel=1
pkgdesc="Perl Reply plugin for powerlevel10k style prompt and WakaTime time tracking"
arch=(any)
url=https://github.com/wakatime/Reply-Plugin-Prompt
license=(GPL3)
depends=(perl-reply)
optdepends=('perl-file-xdg>=1.00: support configure file' 'git: get project name')
# https://github.com/rwstauner/Git-DescribeVersion/issues/1
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.0.tar.gz")
sha256sums=('38e7435d3ccb294721c1e4044cc450e0c7bfcdc35f56577e00e0b78efd11816e')

build() {
  cd $_pkgname-$pkgver.0 || return 1
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL
  make
}

check() {
  cd $_pkgname-$pkgver.0 || return 1
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_pkgname-$pkgver.0 || return 1
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
