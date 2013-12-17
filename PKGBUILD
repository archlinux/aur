# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Aurélien Wailly <aurelien.wailly@gmail.com>

pkgname=netcf
pkgver=0.2.3
pkgrel=3
pkgdesc="A library for configuring network interfaces"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://fedorahosted.org/netcf/"
depends=('augeas>=0.7.4' 'netctl' 'libxslt' 'libxml2' 'libnl')
makedepends=('gcc')
source=("https://fedorahosted.org/released/netcf/$pkgname-$pkgver.tar.gz")
md5sums=('bee292470b06201b59af0fad473a1b65')

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
  rm -rf $pkgdir/etc/rc.d
}
