# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Freed-Wu/Reply-Plugin-Prompt
_source_type=github-releases
_upstreamver='0.0.11'
_pkgname=${_repo##*/}

pkgname=perl-$(tr A-Z a-z <<<${_repo##*/})
_major_minor=${_upstreamver%.*}
_revision=${_upstreamver##*.}
pkgver="$_major_minor.$((_revision + 1))"
pkgrel=1
pkgdesc="Reply plugin for powerlevel10k style prompt"
arch=(any)
url=https://github.com/$_repo
license=(GPL3)
depends=(perl-reply)
optdepends=('perl-file-xdg>=1.00: support configure file')
source=("https://cpan.metacpan.org/authors/id/F/FR/FREED/$_pkgname-$pkgver.tar.gz")
sha256sums=('52e1c09b78e56ed59d56597b55ed084c0c75257a2f024e7a4bed1ea4ecf73c7f')

build() {
  cd $_pkgname-$pkgver || return 1
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL
  make
}

check() {
  cd $_pkgname-$pkgver || return 1
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_pkgname-$pkgver || return 1
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
