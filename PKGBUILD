# Maintainer: Sebastian J. Bronner <waschtl@sbronner.com>

pkgname=aqbanking-git
pkgver=5.99.35beta
pkgrel=1
pkgdesc="A library for online banking and financial applications"
arch=(x86_64 i686)
url=https://www.aquamaniac.de/rdm/projects/aqbanking
license=(GPL)
depends=(gwenhywfar-git ktoblzcheck libofx)
options=('!makeflags')
provides=(aqbanking)
conflicts=(aqbanking)
source=(git+https://git.aquamaniac.de/git/aqbanking)
sha256sums=(SKIP)
_sourcedir=aqbanking

pkgver() {
  git -C $_sourcedir describe --tags | sed 's/-/+/g'
}

prepare() {
  ACLOCAL_FLAGS='-I /usr/share/aclocal' make -C $_sourcedir -fMakefile.cvs
}

build() {
  $_sourcedir/configure --prefix=/usr --enable-gwenhywfar --with-backends="aqhbci aqofxconnect"
  make
}

package() {
  make DESTDIR=$pkgdir install
}
