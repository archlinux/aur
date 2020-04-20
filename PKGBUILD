# Maintainer:  AK <crt@archlinux.email>
# Contributor: Leif Thande <leif.thande@gmail.com>
pkgname=memfetch
pkgver=0.05b
pkgrel=2
pkgdesc="dumps any userspace process memory without affecting its execution"
url="http://lcamtuf.coredump.cx/"
license=('GPL')
makedepends=('make')
arch=('any')
source=('http://lcamtuf.coredump.cx/soft/memfetch.tgz' 'memfetch_pagesize.patch')
md5sums=('00dcc9e59de408dd0409835fcf866910'
         'df8f11c26522ee0eccd150e05de80a33')

build() {
  cd "${srcdir}/${pkgname}"
  patch -p0 "${srcdir}/${pkgname}"/memfetch.c < "${srcdir}"/memfetch_pagesize.patch
  make 
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D -m755 "${srcdir}/${pkgname}"/memfetch "${pkgdir}"/usr/bin/memfetch
  install -D -m755 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
