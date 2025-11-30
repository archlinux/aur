# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname='python-language-data'
_proj_name='language_data'
pkgver=1.4.0
pkgrel=1
pkgdesc='Languages supplementary data for python-langcodes'
arch=(any)
url='https://github.com/georgkrause/language_data'
license=('MIT')
depends=(
  'python'
  'python-langcodes'
  'python-marisa-trie'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_proj_name::1}/$_proj_name/$_proj_name-$pkgver.tar.gz")
sha256sums=('800e6457e7beda781c156e02d7707e38db2ded026472e07e2c055dc8446ee574')
_tardir="language_data-${pkgver}"

build() {
  cd "${srcdir}/${_tardir}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_tardir}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
