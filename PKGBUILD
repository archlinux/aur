# $Id$
# Maintainer: Bjoern Franke <bjo@nord-west.org>

pkgname=easy-rsa-old
pkgver=2.3.3
pkgrel=1
pkgdesc="Simple shell based CA utility (legacy version)"
arch=(any)
url="https://github.com/OpenVPN/easy-rsa-old"
depends=('openssl' 'sh')
license=('custom')
conflicts=('easy-rsa')
backup=('usr/share/easy-rsa/vars'
        'usr/share/easy-rsa/openssl-1.0.0.cnf')
source=(${pkgname}-${pkgver}::https://github.com/OpenVPN/easy-rsa-old/archive/${pkgver}.tar.gz)
md5sums=('14c6f4abd6ea80a99b434d8683fc7aa2')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  autoreconf -i
}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  install -d -m755 ${pkgdir}/usr/share/easy-rsa
  # Install license
  make install DESTDIR="${pkgdir}"
  # Install license
  install -d -m755 "${pkgdir}"/usr/share/licenses/${pkgname}/
  ln -sf /usr/share/doc/${pkgname}/{COPYING,COPYRIGHT.GPL} "${pkgdir}"/usr/share/licenses/${pkgname}/
}
