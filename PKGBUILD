# Maintainer: naniwakun <radio.naniwa[atmark]gmail.com>
pkgname=jd-gtk3
pkgver=r2355.df584e49
pkgrel=2
pkgdesc="A 2channel browser written in C++ using gtkmm3 (patched). This is alpha version by experimental support."
arch=('i686' 'x86_64')
url="https://github.com/ma8ma/JD/tree/gtk3-idea-r2"
license=('GPL2')
makedepends=('git')
depends=('gnutls' 'libsm' 'gtkmm3' 'autoconf-archive')
conflicts=('jd' 'jd-svn' )
source=('git://github.com/ma8ma/JD.git#branch=gtk3-idea-r2')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/JD"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/JD"
  autoreconf -i
  ./configure --prefix=/usr --with-stdthread  --with-gtkmm3
  make
}

package() {
  cd "${srcdir}/JD"
  make DESTDIR=${pkgdir} install
}

