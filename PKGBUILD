# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Zdenek Janak <janak@astronomie.cz>

pkgname=libminpack
pkgver=19961126+dfsg1.5
_pkgver=19961126+dfsg1-5
pkgrel=1
pkgdesc="Software for solving nonlinear equations and nonlinear least squares problems"
arch=(x86_64)
url="https://salsa.debian.org/science-team/minpack"
license=(custom:BSD-4-clause-modified)
depends=(gcc-libs)
makedepends=(gcc-fortran)

source=("$pkgname-$pkgver.tar.gz::$url/-/archive/debian/$_pkgver/minpack-debian-$_pkgver.tar.gz")
sha256sums=('a0be0155e812753871097b2032e62c9cc96abe5e8c906b932a9f18f862998063')

_archive="minpack-debian-$_pkgver"

build() {
  cd "$_archive"

  bash configure --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  cd "$_archive"

  make DESTDIR="$pkgdir/" install

  install -Dm644 debian/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
