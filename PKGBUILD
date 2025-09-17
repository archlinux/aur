# Maintainer: Tobias Frisch <jacki AT thejackimonster DOT de>

_name=language_tool_python
pkgname=python-languagetool-git
pkgver=2.9.4
pkgrel=1
pkgdesc="A free grammar checker for Python"
url="https://pypi.org/project/language-tool-python"
depends=('python' 'python-tqdm' 'python-requests' 'python-psutil' 'python-toml')
makedepends=('git' 'python' 'python-build' 'python-installer' 'python-wheel')
optdepends=()
license=('GPL3')
arch=('any')
source=("git+https://github.com/jxmorris12/$_name.git")
sha256sums=('SKIP')
provides=('python-languagetool')

pkgver() {
	cd "$srcdir/${_name}"
	cat pyproject.toml | grep '^version = ' | tr '"' ' ' | awk '{print $3}'
}

build() {
	cd "$srcdir/${_name}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${_name}"
	python -m installer --destdir="$pkgdir" dist/${_name}-${pkgver}-py3-none-any.whl
}
