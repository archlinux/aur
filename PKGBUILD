# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Aurélien Wailly <aurelien.wailly@gmail.com>

pkgname=netcf
pkgver=0.2.2
pkgrel=4
pkgdesc="A library for configuring network interfaces"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://fedorahosted.org/netcf/"
depends=('augeas>=0.7.4' 'netctl' 'libxslt' 'libxml2' 'libnl')
makedepends=('gcc')
options=(!libtool)
source=("https://fedorahosted.org/released/netcf/$pkgname-$pkgver.tar.gz")
md5sums=('fbcd47101797b8fcd9519e22002cd200')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  aclocal
  automake --add-missing || true
  autoreconf
  ./configure --prefix=/usr \
	--disable-static \
	--with-init-script=none \
	--with-driver=redhat
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
  rm -rf $pkgdir/etc/rc.d/init.d
}
