# Maintainer: Liam Timms <timms5000@gmail.com>
# Co-maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-openai
_name=${pkgname#python-}
pkgver=0.27.3
pkgrel=1
pkgdesc="Python client library for the OpenAI API"
arch=('any')
url="https://openai.com"
license=('MIT')
depends=('python-aiohttp' 'python-requests' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-numpy: Needed for CLI fine-tuning data preparation tool'
            'python-pandas: Needed for CLI fine-tuning data preparation tool'
            'python-pandas-stubs: Needed for type hints for mypy'
            'python-openpyxl: Needed for CLI fine-tuning data preparation tool xlsx format')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0941a7322dc1ddbf15ed76702bb88d4f0c7586c3536433906dbd24cf6f2398d9')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

