# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=s6
pkgver=2.15.1.1
pkgrel=1
pkgdesc='A small suite of programs for UNIX, designed to allow process supervision'
arch=('x86_64')
url="https://skarnet.org/software/${pkgname}"
license=('ISC')
depends=('skalibs' 'execline')
options=('!lto')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('62080839eb5b04d51efd4ef6e7b43e29b5d0576efce9eb319ace32ea90c05931')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin --enable-shared --disable-static --disable-allstatic
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
