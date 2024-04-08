# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname='python-language-data'
_proj_name='language_data'
pkgver=1.1
pkgrel=1
pkgdesc='Languages supplementary data for python-langcodes'
arch=(any)
url='https://github.com/rspeer/language_data'
license=('custom:MIT')  # No LICENSE file in the git repo
depends=(
  'python'
  'python-langcodes'
  'python-setuptools'
  'python-marisa-trie')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_proj_name::1}/$_proj_name/$_proj_name-$pkgver.tar.gz")
sha256sums=('c1f5283c46bba68befa37505857a3f672497aba0c522b37d99367e911232455b')
_tardir="language_data-${pkgver}"

build() {
  cd "${srcdir}/${_tardir}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_tardir}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
