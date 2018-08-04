# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor Jon Sturm <Jasturm002@aol.com>
# Contributor: mickael9 <mickael9@gmail.com>

pkgname=libticables
pkgver=1.3.5
pkgrel=2
pkgdesc="TI Link Cable Library"
arch=('i686' 'x86_64')
url="http://lpg.ticalc.org/prj_tilp/"
license=('GPL2')
options=('!libtool')
depends=('libusb' 'glib2')
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.18/${pkgname}2-${pkgver}.tar.bz2"
        "69-libticables.rules")
md5sums=('b954d7524c5a35e34651725d4b38fe9c'
         '2e38fe89764f129c567b06afbbdfdcd0')

build() {
  cd "${srcdir}/${pkgname}2-${pkgver}"

  autoreconf -fi
  ./configure --prefix=/usr --enable-libusb10
  make
}

package() {
  cd "${srcdir}/${pkgname}2-${pkgver}"

  make install DESTDIR="${pkgdir}"
  install -Dm644 "${srcdir}/69-libticables.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/69-libticables.rules"
}
