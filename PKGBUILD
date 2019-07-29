# Maintainer: Andrew Sun <adsun701@gmail.com>

_pkgname=ldns
pkgname=lib32-${_pkgname}
pkgver=1.7.1
pkgrel=1
pkgdesc='Fast DNS library supporting recent RFCs (32-bit)'
url='https://www.nlnetlabs.nl/projects/ldns/'
license=('custom:BSD')
arch=('x86_64')
depends=('lib32-openssl' 'ldns')
makedepends=('lib32-libpcap')
source=("https://www.nlnetlabs.nl/downloads/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8ac84c16bdca60e710eea75782356f3ac3b55680d40e1530d7cea474ac208229')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=/usr/lib32 \
    --localstatedir=/var \
    --disable-rpath \
    --with-drill \
    --without-examples

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
