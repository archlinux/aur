# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Perl_Package_Guidelines for more
# information on Perl packaging.

# Contributor: Your Name <youremail@domain.com>
pkgname=llgal
pkgver=0.13.17
pkgrel=1
pkgdesc="On-line gallery generator based on iGal"
arch=(x86_64)
url="http://home.gna.org/llgal/"
license=('GPL')
depends=('perl' 'perl-image-size' 'perl-locale-gettext')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://download.gna.org/llgal/$pkgname-$pkgver.tar.bz2)
md5sums=('3d42aaebcea39d0841ef6777a24ace41')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's/\/usr\/local/\/usr/g' Makefile
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
