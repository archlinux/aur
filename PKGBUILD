# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-fuzzywuzzy-git
_pkgname=fuzzywuzzy
pkgver=r180.5f0eb1b
pkgrel=1
pkgdesc='Fuzzy string matching in Python'
arch=(any)
url=https://pypi.python.org/pypi/fuzzywuzzy
license=('custom:unknown')
depends=(python)
optdepends=('python-levenshtein: provides a 4-10x speedup in string matching')
makedepends=(python-setuptools)
source=(git://github.com/seatgeek/fuzzywuzzy/)
md5sums=(SKIP)

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_pkgname}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}
  python setup.py install --root=${pkgdir} --optimize=1
  install -d -m 755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m 644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
