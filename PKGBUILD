# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=flexisip
pkgver=1.0.6
pkgrel=1
pkgdesc="A general purpose SIP proxy with media capabilities"
arch=('i686' 'x86_64')
url="http://flexisip.org"
license=('AGPL3')
groups=()
depends=('belle-sip' 'boost-libs' 'hiredis' 'mediastreamer' 'protobuf' 'sofia-sip-bc' 'unixodbc' 'xsd')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/BelleDonneCommunications/$pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('295f6c7017484c0ea7ce183e586b9c69')

build() {
  CXXFLAGS="$CXXFLAGS -fpermissive"
  cd "$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr \
	--mandir=/usr/share/man \
	--datadir=/usr/share \
	--sysconfdir=/etc \
	--localstatedir=/var/lib \
	--libdir=/usr/lib \
	--enable-odbc \
	--enable-presence \
	--enable-protobuf \
	--enable-redis \
	--enable-transcoder \
	--disable-doc
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
