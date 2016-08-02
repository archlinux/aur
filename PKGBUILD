# Maintainer: Chris Coggburn <chris@coggburn.us>
pkgname=gpa-git
pkgver=0.9.9.r6.g774dbff
pkgrel=1
pkgdesc="A graphical user interface for the GnuPG"
arch=('i686' 'x86_64')
url="https://www.gnupg.org/related_software/gpa/"
license=('GPL3')
depends=('gpgme' 'gtk2' 'desktop-file-utils')
makedepends=('git')
provides=('gpa')
conflicts=('gpa')
source=('gpa-git::git://git.gnupg.org/gpa.git#branch=master')
md5sums=('SKIP')

_gitroot=git://git.gnupg.org/gpa.git
_gitname=gpa

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^gpa-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  ./autogen.sh
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname"
  make -k check || :
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
