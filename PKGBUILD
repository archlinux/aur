# Maintainer: Jochen Saalfeld <jochen@intevation.de>
pkgname='gpgme-python-git'
pkgver=gpgme.1.8.0.r122.g348da58f
pkgrel=1
pkgdesc="A python wrapper library for GnuPG"
arch=('x86_64')
url="https://gnupg.org/software/gpgme/index.html"
license=('GPL2')
provides=('gpgme-python')
conflicts=()
makedepends=('gpgme>=1.8' 'swig' 'gnupg>=2' 'libgpg-error' )
source=("$pkgname::git+git://git.gnupg.org/gpgme.git" )
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --enable-languages=python
  make DESTDIR="${pkgdir}"
}

package() {
  cd $pkgname/lang/python
  make DESTDIR="${pkgdir}" install
}

