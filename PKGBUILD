# Maintainer: Kazuki Sawada <kazuki@6715.jp>

pkgname=libnss-stns
pkgver=2.4.1
pkgrel=1
pkgdesc="We provide name resolution of Linux user group using STNS."
arch=('i686' 'x86_64')
url="https://github.com/STNS/libnss"
license=('MIT')
depends=('curl')
makedepends=('gcc')
source=("https://github.com/STNS/libnss/archive/v${pkgver}.tar.gz")
md5sums=('da45fbe32730b9768c16d1be92e858f8')

build() {
  cd "${srcdir}/libnss-${pkgver}"

  patch stns.c "${startdir}/stns.c.patch"
  patch Makefile "${startdir}/Makefile.patch"

  make
}

package() {
  cd "${srcdir}/libnss-${pkgver}"

  make PREFIX="${pkgdir}/usr" BINSYMDIR="${pkgdir}/usr/bin" install

  install -dm777 "${pkgdir}/var/cache/stns/"
  install -Dm644 stns.conf.example "${pkgdir}/etc/stns/client/stns.conf"
}
