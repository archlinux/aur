# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname='python-aksharamukha'
_proj_name="${pkgname#python-}"
pkgver='2.3'
pkgrel=1
pkgdesc='Indic scripts converter'
arch=(any)
url='https://aksharamukha.appspot.com/python'
license=('AGPL-3.0-only')
depends=(
  'python-fonttools'
  'python-langcodes'
  'python-language-data'
  'python-pykakasi'
  'python-regex'
  'python-requests'
  'python-yaml'
  'python>=3.8')
optdepends=(
  'python-khmer-nltk: processing Khmer script'
  'python-lxml: transliterate_file submodule'
  'python-beautifulsoup4: transliterate_file submodule')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_proj_name::1}/$_proj_name/$_proj_name-$pkgver.tar.gz")
sha256sums=('95417cbbfdc7415f292ac9781726a12aa4bc1be04f9568f0fde289da866e444c')
_tardir="aksharamukha-${pkgver}"

build() {
  cd "${srcdir}/${_tardir}"
  ls
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_tardir}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
