# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Ivy Foster <iff@archlinux.org>

pkgname=physlock
pkgdesc='Lightweight Linux console locking tool'
pkgver=13
pkgrel=6
url='https://github.com/muennich/physlock'
arch=(x86_64)
license=('GPL-2.0-or-later')
depends=('pam')
optdepends=('xss-lock: lock screen on suspend or after inactivity')
backup=('etc/pam.d/physlock')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'physlock.pam')
b2sums=('a43f151c1660c38bd028f80742637a51d5108e6769161c88fb269ac03c827e49bd20e521b8face6aa6a71a8ab65ddf8662e81e8251b74c13388070ed04d4e13b'
        'c7e0bb240c5669b1c9321db67c50dd0eb60ed6473aa4c68803c5bb550df93798e66d3f3deec75c8226d03354fc29e86c77db096f791aedd9072b1e3c53b76d4a')

build() {
  cd "physlock-${pkgver}"

  make
}

check() {
  cd "physlock-${pkgver}"

  ./physlock -h
}

package() {
  cd "physlock-${pkgver}"

  make PREFIX='/usr' DESTDIR="${pkgdir}" install

  install -vD -m644 ../physlock.pam -T "${pkgdir}/usr/lib/pam.d/physlock"
}
