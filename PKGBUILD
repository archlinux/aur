# Maintainer: Kevin Rauwolf <sweetpea-aur@tentacle.net>
_author=AUTHOR_NAME
_perlmod="Sun-Solaris-Kstat"
pkgname=perl-kstat-git
_pkgname=perl-kstat
pkgver=862a193e1c
pkgrel=1
pkgdesc='Sun::Solaris::Kstat perl module for linux-zfs'
arch=('any')
url="https://github.com/zfsonlinux/linux-kstat"
license=('GPL')
depends=('perl>=5.10' 'zfs-git' 'spl-git' 'spl-utils-git')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=($_pkgname)
backup=()
options=(!emptydirs)
install=
source=("$_pkgname::git+https://github.com/zfsonlinux/linux-kstat.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make install DESTDIR="$pkgdir"

  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
