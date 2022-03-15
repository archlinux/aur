# Contributor: Sergej Pupykin <sergej.pupykin@dsr-company.com>
_base=i2c-ch341
pkgname=${_base}-dkms
pkgver=20210501
pkgrel=1
pkgdesc="CH341 USB-I2C adapter driver"
license=(GPL)
arch=('i686' 'x86_64')
depends=(dkms)
makedepends=(git)
optdepends=('linux-headers: build the module against Arch kernel'
  'linux-ck-headers: build the module against Linux-ck kernel'
  'linux-lts-headers: build the module against LTS Arch kernel')
url="https://github.com/gmarco/${_base}"
source=(git+${url}
  dkms.conf.in)
sha512sums=('SKIP'
  '8381debabec448a1d5ab9eb95bd79473378f704cf1304621802d9114fe2d92585fc9c3da970f63dbf9fdea7337c8a6993540ce01dc60fc58669be8ac64c61139')

package() {
  cd ${_base}
  install -dm755 "${pkgdir}/usr/src/${_base}-${pkgver}/"
  for i in "${srcdir}/${_base}/"{Makefile,*.c}; do
    install -D -m644 "${i}" "${pkgdir}/usr/src/${_base}-${pkgver}/"
  done
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" >"${pkgdir}/usr/src/${_base}-${pkgver}/dkms.conf"
}
