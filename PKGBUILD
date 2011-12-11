# Contributor: Aurélien Wailly <aurelien.wailly@gmail.com>

pkgname=netcf
pkgver=0.1.7
pkgrel=2
pkgdesc="A library for configuring network interfaces"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://fedorahosted.org/netcf/"
depends=('augeas>=0.7.4' 'netcfg' 'libxslt' 'libxml2' 'libnl')
makedepends=('gcc')
options=(!libtool)
source=("https://fedorahosted.org/released/netcf/$pkgname-$pkgver.tar.gz"
        netcf-0.1.7.patch)
md5sums=('8e313b623c907eb035cf3948b71fecc2'
         '0e88ee6813219e9e75a943444fe439f5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ${srcdir}/netcf-0.1.7.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
