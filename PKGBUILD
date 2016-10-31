# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Aurélien Wailly <aurelien.wailly@gmail.com>

pkgname=netcf
pkgver=0.2.8
pkgrel=3
pkgdesc="A library for configuring network interfaces"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://fedorahosted.org/netcf/"
depends=('augeas>=0.7.4' 'libxslt' 'libxml2' 'libnl')
makedepends=('gcc')
source=("https://fedorahosted.org/released/netcf/$pkgname-$pkgver.tar.gz")
md5sums=('8edfc9a5856468ae4f8ee97415a3dbf3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  aclocal
  automake --add-missing || true
  autoreconf
  ./configure --prefix=/usr \
	--disable-static \
	--with-init-script=none \
	--with-driver=redhat \
	--libexecdir=/usr/lib/$pkgname
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/etc/rc.d
}
