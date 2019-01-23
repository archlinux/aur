# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Dmitrij D. Czarkoff <czarkoff@gmail.com>

pkgname=re
pkgver=0.6.0
pkgrel=1
pkgdesc="portable library for real-time communications"
arch=('i686' 'x86_64')
url="http://creytiv.com/re.html"
license=('BSD')
depends=('openssl' 'zlib')
source=("http://creytiv.com/pub/${pkgname}-${pkgver}.tar.gz"
        "re-flags.patch")
sha256sums=('0e97bcb5cc8f84d6920aa78de24c7d4bf271c5ddefbb650848e0db50afe98131'
            'fb1c3db52d49953dbc689b105b3bf90c86ddbde44fbe2cfcf2f271c02e48d36b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/re-flags.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 docs/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
