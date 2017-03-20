# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=flexisip
pkgver=1.0.10
pkgrel=2
pkgdesc="A general purpose SIP proxy with media capabilities"
arch=('i686' 'x86_64')
url="http://flexisip.org"
license=('AGPL3')
groups=()
depends=('belle-sip' 'boost-libs' 'hiredis' 'mediastreamer' 'protobuf' 'sofia-sip-bc>=1.13.12' 'unixodbc' 'xsd' 'soci')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/BelleDonneCommunications/$pkgname.git#commit=cf47b79bd656"
    "flexisip.service")
noextract=()
sha256sums=('SKIP'
            '2a96c6604c62ea6b70f0bd6e96c6910afef6e17ac8d44ce0a50cce60279946be')

build() {
  cd "$pkgname"

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
	--disable-doc \
    --disable-strict
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
  install -Dm0644 "$srcdir/flexisip.service" "$pkgdir/usr/lib/systemd/system/flexisip.service"
}
