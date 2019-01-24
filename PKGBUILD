# Maintainer: naniwakun <radio.naniwa[atmark]gmail.com>
pkgname=jdim-git
pkgver=r2367.46c1c2e8
pkgrel=1
pkgdesc="A 2channel browser written in C++ using gtkmm3. This is public beta version."
arch=('i686' 'x86_64')
url="https://github.com/ma8ma/JDim/tree/gtk3-preview"
license=('GPL2')
makedepends=('git')
depends=('gnutls' 'libsm' 'gtkmm3' 'autoconf-archive')
conflicts=('jd' 'jd-svn' 'jd-gtk3' )
source=('git://github.com/ma8ma/JDim.git#branch=gtk3-preview')
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

