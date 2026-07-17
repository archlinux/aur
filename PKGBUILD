# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

_pkgname=ttynvt
pkgname="${_pkgname}"
pkgver=0.17
pkgrel=1

pkgdesc='Virtual Network Terminal supporting the Com Port Control Option (RFC2217)'
arch=('x86_64')
url='https://gitlab.com/lars-thrane-as/ttynvt'
license=('GPL-2.0-or-later')
depends=('fuse2')
makedepends=('glibc' 'fuse2')
conflicts=("${_pkgname}")
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('1790b2c2685743d750a4f9736476698a4e952013a111548fe66e5052b0e3b111')

build() {
  cd "${srcdir}/${_pkgname}"
  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
  install -Dm 644 COPYING -T "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et
