#!/bin/bash
# Maintainer: oldherl <oldherl@gmail.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Fabio Zanini <fabio.zanini _at_ stanford.edu>

pkgname=python-pysam
_name=pysam
pkgver=0.22.0
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
sha1sums=(SKIP)

build() {
  cd "$srcdir/$_name-$pkgver"

  export HTSLIB_LIBRARY_DIR=/usr/lib
  export HTSLIB_INCLUDE_DIR=/usr/include
  export FORCE_CYTHON=1

  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 "$srcdir/$_name-$pkgver/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"
}
