# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Jon Sturm <Jasturm002@aol.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

pkgname=tilp
pkgver=1.18
pkgrel=1
pkgdesc="TI graphing calculator link/transfer program"
arch=('i686' 'x86_64')
url="http://lpg.ticalc.org/prj_tilp/"
license=('GPL2')
depends=('gtk2' 'libticalcs')
makedepends=('intltool')
optdepends=('gfm: to manage and manipulate TI Group Files (backups)')
source=("http://sourceforge.net/projects/tilp/files/tilp2-linux/tilp2-${pkgver}/tilp2-${pkgver}.tar.bz2"
        "remove-broken-kde-support.patch")
md5sums=('daff9cb7a86af8965453e737f8fba781'
         'b678c0fade4b2daffc5662d7094b1544')

prepare() {
  cd "${srcdir}/tilp2-${pkgver}"

  patch -Np1 < "${srcdir}/remove-broken-kde-support.patch"
}

build() {
  cd "${srcdir}/tilp2-${pkgver}"

  autoreconf -ivf
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/tilp2-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
