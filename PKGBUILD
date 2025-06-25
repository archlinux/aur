# Maintainer: VCalV

_user_gh="lmstudio-ai"
_name_gh="lmstudio-python"
_name_pip="lmstudio"
pkgname="python-lmstudio"
pkgver=1.3.2
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
sha512sums=('2a60c694940aa50b2eef48118c3aeb29deb8513a63f7bca5880a45758d52bb91f74a5d28ba71c7611e29859622075c44b54c5378af0eb7dcba4838cee277a403')

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

