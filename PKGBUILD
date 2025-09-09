# Maintainer: VCalV

_user_gh="lmstudio-ai"
_name_gh="lmstudio-python"
_name_pip="lmstudio"
pkgname="python-lmstudio"
pkgver=1.5.0
pkgrel=2
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
	'python-typing_extensions>=4.12.2'
)

makedepends=(
	python-build
	python-installer
	python-wheel
	python-pdm-backend
)

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
sha512sums=('70812805098631962e40fc0e99c7689b26b2385941b1684abdcfcc13e6f0208572f802439d5872caf96247ad4fa52b2b581d1bffc2ef07004db47912442509a9')

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

