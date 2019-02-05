# Maintainer: Honghao Li <im@rasphino.cn>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>

pkgname=stow-git
pkgver=20180211
pkgrel=1
pkgdesc='Manage installation of multiple softwares in the same directory tree, git version'
url='http://www.gnu.org/software/stow/'
arch=('x86_64')
license=('GPL2')
depends=('perl')
makedepends=('git' 'texi2html' 'texinfo' 'texlive-core')
checkdepends=('perl-test-output' 'perl-io-stringy')
source=("git://git.savannah.gnu.org/stow.git")
md5sums=('SKIP')
provides=('stow')
conflicts=('stow')
_gitname="stow"

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  autoreconf -iv
}

build() {
  cd "${srcdir}/${_gitname}"
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --with-pmdir=/usr/share/perl5/vendor_perl
  make
}

check() {
  cd "${srcdir}/${_gitname}"
  make check
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
