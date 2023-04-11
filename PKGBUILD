# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=Reply-Plugin-Prompt
pkgname=perl-reply-plugin-prompt
pkgver=0.0.12
pkgrel=1
pkgdesc="Reply plugin for powerlevel10k style prompt"
arch=(any)
url=https://github.com/Freed-Wu/Reply-Plugin-Prompt
license=(GPL3)
depends=(perl-reply)
optdepends=('perl-file-xdg>=1.00: support configure file')
# https://github.com/rwstauner/Git-DescribeVersion/issues/1
_pkgver="$pkgver.0"
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.0.tar.gz")
sha256sums=('872640f337c793433a4d2b1a2201395d75644ec4966136b8bce13f481dce26db')

build() {
  cd $_pkgname-$_pkgver || return 1
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL
  make
}

check() {
  cd $_pkgname-$_pkgver || return 1
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_pkgname-$_pkgver || return 1
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
