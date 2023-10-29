# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>

_pyname=dallecli
pkgname=python-$_pyname
pkgver=1.3.0
pkgrel=2
pkgdesc='CLI/TUI for OpenAI’s DALL-E (2) image generation model'
arch=(any)
url="https://github.com/raiyanyahya/dallecli/"
license=(MIT)
_pydeps=(click openai rich idna pillow)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(cython
             python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-coverage
              python-pytest-runner)
_archive="$_pyname-$pkgver"
source=("https://github.com/raiyanyahya/dallecli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fa1bdd4cc028c15fd3a7cb2160f9a45881af8db79acab30a4c366e66b74b37b7')
provides=(dallecli)

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	python -m unittest discover
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

