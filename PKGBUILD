# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgbase=python-mbdata
_name=${pkgbase#python-}
pkgname=$pkgbase
pkgver=27.1.0
pkgrel=1
pkgdesc='MusicBrainz database tools for Python'
url="https://pypi.python.org/pypi/$_name"
arch=('any')
license=('MIT')
depends=('python>=3.7' 'python-six>=1.16.0')
optdepends=('python-psycopg2: for replication'
            'python-lxml: for search'
            'python-sqlalchemy: for models')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$_name-$pkgver-LICENSE::https://github.com/acoustid/mbdata/raw/v$pkgver/LICENSE")
sha256sums=('83c17e6670fe73ecf3bb1bfcb5eecbf9ad8bb9e3bc4ea6daa19cdbc2b6f1aab5'
            'ecae6699839c9b7845aa36aba997c2ec5f09c5eb237f8910b972269de4bfc5f9')

build() {
  cd "$_name-$pkgver"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../"$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgbase/LICENSE"
}
