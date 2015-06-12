# $Id$
# Maintainer: Alphazo <alphazo@gmail.com>
# Contributor: Adrian Cohea <adriancohea@gmail.com>

_gitname=libgcrypt
pkgname=libgcrypt-git
pkgver=1.6.0+164+gceaa97f
pkgrel=1
pkgdesc="General purpose cryptographic library based on the code from GnuPG"
arch=(i686 x86_64)
url="http://www.gnupg.org"
license=('LGPL')
depends=('libgpg-error>=1.13-1')
makedepends=('git' 'ghostscript' 'transfig')
provides=("libgcrypt=${pkgver}")
conflicts=('libgcrypt')
install=${pkgname}.install
source=("git://git.gnupg.org/libgcrypt.git")
sha1sums=('SKIP')

pkgver() {
  cd "$_gitname"

  git describe --tags | sed 's/libgcrypt-//;s/-/+/g'
}

build() {
  cd "$_gitname"
   ./autogen.sh --force
   ./configure --prefix=/usr --enable-maintainer-mode --disable-static --disable-padlock-support
  make
}

check() {
  cd "$_gitname"
  make check
}

package() {
  cd "$_gitname"
  make DESTDIR=${pkgdir} install
}
