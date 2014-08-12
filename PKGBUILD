# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Based on the works of selir <seliur@lavabit.com> and
# muflax <muflax@gmail.com>

pkgname=mdk
pkgver=1.2.8
pkgrel=1
pkgdesc="An emulation of Donald Knuth's mythical MIX computer."
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/mdk/mdk.html'
license=('GPL3')
depends=('libglade' 'gtk2' 'readline')
optdepends=('guile')
makedepends=('intltool' 'glib2' 'texinfo')
install=mdk.install
source=("http://ftp.gnu.org/gnu/mdk/v${pkgver}/mdk-${pkgver}.tar.gz")
md5sums=('86057f1b05c7673ee000d7b15231f5a6')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -e 's|-DG_DISABLE_DEPRECATED||g' -i configure
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
