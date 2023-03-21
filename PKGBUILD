# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Freed-Wu/Reply-Plugin-Prompt
_source_type=github-releases
_upstreamver='0.0.10'
_pkgname=${_repo##*/}

pkgname=perl-$(tr A-Z a-z <<<${_repo##*/})
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="Reply plugin for powerlevel10k style prompt"
arch=(any)
url=https://github.com/$_repo
license=(GPL3)
depends=(perl-reply)
optdepends=('perl-file-xdg>=1.00: support configure file')
source=("https://cpan.metacpan.org/authors/id/F/FR/FREED/$_pkgname-$pkgver.tar.gz")
sha256sums=('437278c6ce07211e9b90751d175f049fd14fc95cf01c170f281a44ef592f8166')

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
