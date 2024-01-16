pkgname=python-hypothesmith-032
pkgver=0.3.2
pkgrel=1
pkgdesc="Hypothesis strategies for generating Python programs, something like CSmith"
url="https://github.com/Zac-HD/hypothesmith"
provides=('python-hypothesmith=0.3.2')
conflicts=('python-hypothesmith')
license=('MPL')
arch=('any')
depends=('python-hypothesis' 'python-lark-parser' 'python-libcst')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-black' 'python-parso' 'python-pytest')
source=("https://pypi.io/packages/source/h/hypothesmith/hypothesmith-$pkgver.tar.gz")
sha512sums=('8e84eaa02fd86a9fe2b446c516b8dccb5f5f3ec84035f70c09fd88fcbbb3cfdc5bc36d95a22734d9d9d6a841d17d8f0198ec08daf3331f39c96c7b687fe2f22a')

prepare() {
  cd hypothesmith-$pkgver
  sed -e '/--cov/d' -i tox.ini
}

build() {
  cd hypothesmith-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd hypothesmith-$pkgver
  PYTHONPATH="$PWD/build/lib" pytest -v
}

package() {
  cd hypothesmith-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
