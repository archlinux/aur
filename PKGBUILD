# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=xapian-core-git
pkgver=v1.4.0.2731.g31ccc3a82
pkgrel=2
pkgdesc="Open source search engine library"
arch=('i686' 'x86_64')
url="https://github.com/xapian/xapian"
license=('GPL')
depends=('zlib' 'util-linux')
makedepends=(
  'git'
  'automake'
  'autoconf'
  'libtool'
  'help2man'
  'graphviz'
  'doxygen'
  'python-docutils'
  'python-pygments'
  'tcl'
)
provides=('xapian-core')
conflicts=('xapian-core')
source=("git://github.com/xapian/xapian")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/xapian"
  git describe --long | sed 's/Release_//;s/-/./g'
}

build() {
  cd "$srcdir/xapian"
  ./bootstrap --without-autotools xapian-core

  cd "$srcdir/xapian/${pkgname/-git/}"
  ./configure --prefix=/usr --enable-maintainer-mode
  make
}

package() {
  cd "$srcdir/xapian/${pkgname/-git/}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
