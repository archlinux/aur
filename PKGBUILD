# Maintainer: vantu5z <vantu5z@mail.ru>
# Python package author: Mikhail Korobov <kmike84@gmail.com>

pkgname=python-pymorphy2
pkgver=0.9.1
pkgrel=3
pkgdesc="Morphological analyzer (POS tagger + inflection engine) for Russian language."
arch=(any)
url="https://github.com/kmike/pymorphy2/"
license=(MIT license)
depends=("python-pymorphy2_dicts<3.0" "python-pymorphy2_dicts>=2.4"
         "python-docopt>=0.6"
         "python-dawg-python>=0.7")
optdepends=("python-pymorphy2-dicts-ru: russian language"
            "python-pymorphy2-dicts-uk: ukraine language")
makedepends=("python-build" "python-installer" "python-wheel")
source=("pymorphy2::git+https://github.com/kmike/pymorphy2#tag=$pkgver")
md5sums=('SKIP')

prepare()
  {
    # apply python 3.11 fix
    cd "$srcdir/pymorphy2"
    git fetch origin pull/161/head:fix_python_311
    git merge fix_python_311
  }

build()
  {
    cd "$srcdir/pymorphy2"
    python -m build --wheel --no-isolation
  }

package()
  {
    cd "$srcdir/pymorphy2"
    python -m installer --destdir="$pkgdir" dist/*.whl
  }
