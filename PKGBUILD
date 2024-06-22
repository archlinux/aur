# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: fzerorubigd <fzero@rubi.gd>
_pkgmain=backports.csv
pkgname=python-$_pkgmain
pkgver=1.0.7
pkgrel=9
pkgdesc="Backport of Python 3 csv module."
arch=('any')
url="https://github.com/ryanhiebert/backports.csv"
license=('PSF-2.0')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
options=(!emptydirs)
source=("$pkgname-$pkgver.zip::https://github.com/ryanhiebert/backports.csv/archive/${pkgver}.zip")
b2sums=('78462bc5d80097fe64bde1113784235be74ba92e48fadba7d3358048beaabd0139e85dd0dbf2aad7f4d669fcbf4ade53f20ded5c5ed460990875acd32ea0f358')

build() {
  cd "$srcdir/$_pkgmain-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgmain-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -m755 -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" README.rst HISTORY.rst
}
