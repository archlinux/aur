# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Aurélien Wailly <aurelien.wailly@gmail.com>

pkgname=netcf
pkgver=0.1.7
pkgrel=4
pkgdesc="A library for configuring network interfaces"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://fedorahosted.org/netcf/"
depends=('augeas>=0.7.4' 'netcfg' 'libxslt' 'libxml2' 'libnl1')
makedepends=('gcc')
options=(!libtool)
source=("https://fedorahosted.org/released/netcf/$pkgname-$pkgver.tar.gz"
        netcf-0.1.7.patch)
md5sums=('8e313b623c907eb035cf3948b71fecc2'
         'd7e6fc7e3efb9c2160b2f3ad30995165')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ${srcdir}/netcf-0.1.7.patch
  aclocal
  automake --add-missing
  autoreconf
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
