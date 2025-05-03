# Maintainer: envolution
# Contributor:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Barthalion <echo YXVyQGJwaW90cm93c2tpLnBsCg== | base64 -d>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=sandbox
pkgver=2.46
pkgrel=1
pkgdesc="Gentoo sandbox tool and library"
arch=('i686' 'x86_64')
url='http://www.gentoo.org/'
url='https://github.com/gentoo/sandbox/'
license=('GPL-2.0-only')
options=(!lto)
makedepends=(autoconf)
backup=(
  'etc/sandbox.conf'
  'etc/sandbox.d/00default'
)
source=($pkgname-$pkgver.tar.gz::https://github.com/gentoo/sandbox/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('d4da913f49ee5e0e479665f5dd13d8f028e97167944bda01e37f9d9ba9b14142')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
