# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Pranay Kanwar <pranay.kanwar@gmail.com>

pkgname=zzuf
pkgver=0.14
pkgrel=1
pkgdesc="Transparent application input fuzzer"
url='https://github.com/samhocevar/zzuf'
arch=('i686' 'x86_64')
license=('custom:WTF')
depends=('glibc')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/samhocevar/zzuf/archive/v${pkgver}.tar.gz)
sha512sums=('52f54505b08c77e3fffee6ad15f2012e480a8a71164ecafff98ce9273e0a31a2c4d112dd79154c5c24fea5485831618afad48a9725357dd9e4caf8b539f7acbe')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  # ignore test results because of upstream bug #7
  make check||true
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
