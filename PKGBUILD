# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname=mindi-busybox
pkgver=1.25.1
pkgrel=2
pkgdesc="Busybox version specially configured for Mindi"
arch=('x86_64')
url="http://www.mondorescue.org/"
license=('GPL2')
depends=('glibc')
source=("https://hub.darcs.net/stef204/mondorescue-aur/raw/${pkgname}-${pkgver}.tar.gz")
sha512sums=('56cfa5c95a2527022884e3ac7bcfe43cb95df12f162f2c1988003763d30dacfc3215ff87ffd11712e60114d390d211d9da4adf4da25456f8a01f6c19b479ccbc')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/(opt & OPT_SET) && stime(&ts.tv_sec)/(opt \& OPT_SET) \&\& clock_settime(CLOCK_REALTIME, \&ts)/' coreutils/date.c
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make oldconfig
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make CONFIG_PREFIX="${pkgdir}/usr/lib/mindi/rootfs/usr" install
  find "${pkgdir}/usr/lib/mindi/rootfs" -type d -exec chmod 755 {} \;
}
