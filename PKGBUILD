# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-shy-sh
_pkgname=shy-sh
pkgver=1.3.4
pkgrel=1
pkgdesc="Shell copilot: an AI copilot for your shell (installs as 'shy')"
arch=('any')
url="https://github.com/mceck/shy-sh"
license=('MIT')
depends=('python' 'python-typer' 'python-langchain' 'python-pyyaml' 'python-pydantic-settings' 'python-pyperclip' 'python-questionary' 'python-tzlocal' 'python-tiktoken')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
_tag="v1.3.4"
_srcdir="shy-sh-1.3.4"
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/mceck/shy-sh/tar.gz/refs/tags/$_tag")
sha256sums=('ccca37134b1c38f3841e2f6c9e9a78db3d259d228cf3aab57232460646e26a86')

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
