# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Hans-Nikolai Viessmann <hans AT viess.mn>

_pkgname=dateutils
pkgname=python-$_pkgname
pkgver=0.6.8
pkgrel=2
pkgdesc="Utilities for working with datetime objects."
arch=('any')
url="https://github.com/plytophogy/python-dateutils"
license=('Unlicense')
depends=('python-dateutil' 'python-argparse' 'python-pytz')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('15e564d9cd34e4260cf96625a3249c938c3aada2e5eaddf8218dd3fbc8dbdba4')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # for some reason the PyPi version is missing some fixes found in the repo to make it python3 compatible.
  sed -e 's/print dt.strftime(args.format)/print(dt.strftime(args.format))/' -i "${_pkgname}/dateadd.py"
  sed -e 's/print __import__(args.unit)(end_dt, start_dt, \*\*kwargs)/print(__import__(args.unit)(end_dt, start_dt, \*\*kwargs))/' -i "${_pkgname}/datediff.py"
}

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
