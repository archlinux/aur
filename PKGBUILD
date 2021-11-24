#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Fabio Zanini <fabio.zanini _at_ stanford.edu>

pkgname=python-pysam
_name=pysam
pkgver=0.18.0
pkgrel=1
pkgdesc='Python interface for the SAM/BAM sequence alignment and mapping format'
arch=('x86_64')
url="https://github.com/pysam-developers/pysam"
license=('MIT')
depends=('python')
makedepends=(
  'python-setuptools'
  'cython'
  'htslib'
)
provides=('python-pysam')
options=(!emptydirs)
source=("https://github.com/pysam-developers/${_name}/archive/v${pkgver}.tar.gz")
b2sums=('bc38e5dc0c7714001ead895d01e18063fedb2da5c4c1d907c0d832da19924f5c7a3c65bf85e7148cbc0c3f37317a56e82e06bc7850c11d971bd22757433b74f5')

build() {
  cd "$srcdir/$_name-$pkgver"

  export HTSLIB_LIBRARY_DIR=/usr/lib
  export HTSLIB_INCLUDE_DIR=/usr/include

  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 "$srcdir/$_name-$pkgver/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"
}
