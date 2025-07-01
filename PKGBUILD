# Maintainer: VCalV

_user_gh="lmstudio-ai"
_name_gh="lmstudio-python"
_name_pip="lmstudio"
pkgname="python-lmstudio"
pkgver=1.4.1
pkgrel=1
pkgdesc="LM Studio Python SDK "
arch=('any')
url="https://github.com/$_user_gh/$_name_gh"
license=('MIT')
depends=(
	'python>=3.13'
	'python-httpx>=0.27.2'
	'python-httpx-ws>=0.7.0'
	'python-msgspec>=0.19.0'
	'python-anyio>=4.8.0'
)

#makedepends=(
#	python-build
#	python-installer
#	python-wheel
#)

#checkdepends=(
#	'python-tox>=4.16.0'
#	#"python-tox-gh>=1.3.2",
#    #"python-tox-pdm>=0.7.2",
#    "python-pytest>=8.3.1",
#    "python-pytest-asyncio>=0.24.0",
#    "python-pytest-subtests>=0.13.1",
#    "ruff>=0.5.4",
#    "mypy>=1.11.0",
#    "python-coverage>=7.6.4",
#)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name_pip::1}/${_name_pip//-/_}/${_name_pip//-/_}-$pkgver.tar.gz")
sha512sums=('7358e496dc190ad4a6afadcee41b799997de0d228dd897beba8d4a1cb935119d726b352912096fb465e890f427de7914049cad0736990002ddebfaf764bc5d37')

build() {
  cd "$_name_pip-$pkgver"
  python -m build --wheel --no-isolation
}

#check(){
#  return 0; #TODO
#  cd "$_name_pip-$pkgver"
#  pytest -o addopts=""
#}

package() {
  cd "$_name_pip-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

