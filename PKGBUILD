# Maintainer: naniwakun <radio.naniwa[atmark]gmail.com>
pkgname=jdim-git
pkgver=r2408.35eca000
pkgrel=2
pkgdesc="A 2channel browser written in C++ using gtkmm3. This is public beta version."
arch=('i686' 'x86_64')
url="https://github.com/JDimproved/JDim/tree/master"
license=('GPL2')
makedepends=('git')
depends=('gnutls' 'libsm' 'gtkmm3' 'autoconf-archive')
conflicts=('jd' 'jd-svn' 'jd-gtk3' )
source=('git://github.com/JDimproved/JDim.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/JDim"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/JDim"
  autoreconf -i
  ./configure --prefix=/usr --with-stdthread  --with-gtkmm3
  make
}

package() {
  cd "${srcdir}/JDim"
  make DESTDIR=${pkgdir} install
}

