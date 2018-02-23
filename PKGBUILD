# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Maintainer: dale <dale@archlinux.org>

pkgname=pilot-link
pkgver=0.12.5
pkgrel=1
pkgdesc="A suite of tools for connecting to PalmOS handheld devices"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('readline>=6.0' 'libpng>=1.4.0' 'libusb-compat' 'popt' 'bluez>=4.59')
options=('!libtool')
url=http://www.pilot-link.org/
source=(https://mirrors.slackware.com/slackware/slackware-14.1/source/l/pilot-link/$pkgname-$pkgver.tar.bz2
        pilot-link-png14.patch)
md5sums=('568c55bf504b044f6fbd50baa407c990'
         'a21a2eeb01544a8a261a75e64a3120c3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/pilot-link-png14.patch"
  ./configure --prefix=/usr --enable-conduits --enable-libusb \
    --with-libiconv --with-libpng
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
