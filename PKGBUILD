# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Daniel Wilhelm <shieldwed [at] outlook [dot] com>

pkgname=bittwist
pkgver=4.7
pkgrel=1
pkgdesc='Libpcap-based Ethernet packet generator'
url='http://bittwist.sourceforge.net'
license=('GPL-2.0-or-later')
arch=($CARCH)
depends=(
  'glibc'
  'libpcap>=1.2.1')
makedepends=(pkgconf)
source=("https://prdownloads.sourceforge.net/${pkgname}/${pkgname}-linux-${pkgver}.tar.gz")

sha256sums=('4c79b6ef20b1ddfac583654ee5ed7567e9972bd75c3c4828802e116ae945819c')

build() {
  cd "${srcdir}/${pkgname}-linux-${pkgver}"
  sed -i -e 's|/usr/local/|/usr/|g' \
    -e 's|-Wl,-Bstatic -lpcap -Wl,-Bdynamic|-lpcap|g' Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}-linux-${pkgver}"
  make prefix="${pkgdir}/usr" install
}
