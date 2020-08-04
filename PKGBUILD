# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: S\u00e9bastien Luttringer
# Contributor: Lawrence Lee <valheru@facticius.net>
# Contributor: Phillip Marvin <phillip.marvin@gmail.com>
# Contributor: keystone <phillip.marvin@gmail.com>

pkgname=libunwind-git
pkgver=v1.5+rc1+44+gf1cee65e
pkgrel=1
pkgdesc='Portable and efficient C programming interface (API) to determine the call-chain of a program'
arch=('x86_64')
url='https://www.nongnu.org/libunwind/'
license=('GPL')
depends=('glibc' 'xz')
provides=(libunwind)
conflicts=(libunwind)
makedepends=('texlive-core')
source=("git+https://github.com/libunwind/libunwind.git")
sha512sums=('SKIP')
validpgpkeys=('SKIP'  # Arun Sharma
              'SKIP') # Dave Watson

pkgver() {
  cd libunwind
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libunwind

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd libunwind
#  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure --prefix=/usr
  make
}

#check() {
#  cd libunwind
  # This function is ``supposed'' to fail. Upstream know, but haven't fixed it.
#  make check || :
#}

package() {
  cd libunwind
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

