# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=ftwin
pkgver=0.8.9
pkgrel=1
pkgdesc="A tool useful to find duplicate files according to their content on your file system"
arch=('i686' 'x86_64')
url="http://freecode.com/projects/ftwin"
license=('APACHE')
depends=('apr-util' 'check' 'libpuzzle')
makedepends=('git' 'autoconf' 'patch')
optdepends=('doxygen: generating docs'
            'graphviz: generating graphs')
source=(git://github.com/fpesce/ftwin.git
        ftwin-make.patch)
md5sums=('SKIP'
         'ca766ceb9060a98005273e5473b5cfdd')

prepare() {
  cd "${srcdir}"/$pkgname

  patch -Np0 -i "${srcdir}"/ftwin-make.patch
}

build() {
  cd "${srcdir}"/$pkgname

  autoreconf -isf
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname

  make DESTDIR="${pkgdir}" install
}
