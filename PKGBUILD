# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Freed-Wu/Reply-Plugin-Prompt
_source_type=github-releases
_upstreamver='0.0.12'
_pkgname=${_repo##*/}

pkgname=perl-$(tr A-Z a-z <<<${_repo##*/})
pkgver=${_upstreamver##v}
# https://github.com/rwstauner/Git-DescribeVersion/issues/1
_pkgver="$pkgver.0"
pkgrel=1
pkgdesc="Reply plugin for powerlevel10k style prompt"
arch=(any)
url=https://github.com/$_repo
license=(GPL3)
depends=(perl-reply)
optdepends=('perl-file-xdg>=1.00: support configure file')
source=("https://cpan.metacpan.org/authors/id/F/FR/FREED/$_pkgname-$_pkgver.tar.gz")
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
