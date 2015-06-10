# $Id: PKGBUILD 146745 2012-01-16 22:52:52Z dreisner $
# Maintainer: Alphazo <alphazo@gmail.com>

pkgname=npth-git
pkgver=1.2+3_ga49a061
pkgrel=1
pkgdesc="A library to provide the GNU Pth API and thus a non-preemptive threads implementationA IPC library used by some GnuPG related software (git version)."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnupg.org/related_software/"
options=('!libtool')
provides=('npth')
conflicts=('npth')
makedepends=('git')

_gitname="npth"
source=("$_gitname::git://git.gnupg.org/npth.git")

pkgver() {
	cd "$srcdir/$_gitname"
	git describe | sed 's|npth-||;s|-|+|;s|-|_|'
}

build() {
   cd "$srcdir/$_gitname"
   autoreconf -fiv
   ./configure --prefix=/usr
   read me
   make
}

check() {
  cd "$srcdir/$_gitname" 
  make check
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR=${pkgdir} install
}
md5sums=('SKIP')

