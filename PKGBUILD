# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-app_paths
_name=${pkgname#python-}
pkgver=0.0.8
pkgrel=1
pkgdesc="Like appdirs, but with pathlib, path creation and async support."
arch=('any')
url="https://github.com/alexdelorenzo/app_paths"
license=('LGPL-3.0-or-later')
depends=(
  'python-aiopath'
  'python-anyio'
  'python-appdirs'
  'python-asyncstdlib'
  'python-strenum'
  'python-unpackable'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/alexdelorenzo/app_paths/master/requirements.txt')
sha256sums=('8c7fd1e28a7f2d52ed3198d01a94f651284fa63384f07a6c676eeefe7dc25f75'
            'd6e2f18382078329548acb1dae4b02f6ba9814d069bc341fb84ac97016302101')

prepare() {
  cp requirements.txt "$_name-$pkgver"
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
