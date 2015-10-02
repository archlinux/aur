# Maintainer: Ingo Sieverdingbeck <aur@sieverdingbeck.com>

pkgname=caff-svn
_pkgname=caff
pkgver=0.r819
pkgrel=1
pkgdesc="CA Fire and Forget is a script that helps you in keysigning."
arch=('any')
url="http://pgp-tools.alioth.debian.org/"
license=('GPL')
depends=('gnupg' 'perl' 'perl-gnupg-interface' 'perl-mime-tools' 'perl-mailtools' 'perl-text-template' 'perl-any-moose' 'perl-net-idn-encode')
makedepends=('subversion')
conflicts=('signing-party-svn')
md5sums=('SKIP')
source=("$_pkgname::svn://svn.debian.org/svn/pgp-tools/trunk/caff")

pkgver() {
  cd "$srcdir/$_pkgname"
  local ver="$(svnversion)"
  printf "0.r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"

  install -D -m755 ${srcdir}/${_pkgname}/caff \
    ${pkgdir}/usr/bin/caff
  install -D -m755 ${srcdir}/${_pkgname}/pgp-clean \
    ${pkgdir}/usr/bin/pgp-clean
  install -D -m755 ${srcdir}/${_pkgname}/pgp-fixkey \
    ${pkgdir}/usr/bin/pgp-fixkey

  install -D -m644 ${srcdir}/${_pkgname}/caff.1 \
    ${pkgdir}/usr/share/man/man1/caff.1
  install -D -m644 ${srcdir}/${_pkgname}/pgp-clean.1 \
    ${pkgdir}/usr/share/man/man1/pgp-clean.1
  install -D -m644 ${srcdir}/${_pkgname}/pgp-fixkey.1 \
    ${pkgdir}/usr/share/man/man1/pgp-fixkey.1
}

# vim:set ts=2 sw=2 et:
