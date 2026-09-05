# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-zev
_pkgname=zev
pkgver=0.11.1
pkgrel=1
pkgdesc="Look up shell commands using natural language (LLM-powered)"
arch=('any')
url="https://github.com/dtnewman/zev"
license=('MIT')
depends=('python' 'python-openai' 'python-platformdirs' 'python-pydantic' 'python-pyperclip' 'python-dotenv' 'python-questionary' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel')
_tag="v0.11.1"
_srcdir="zev-0.11.1"
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/dtnewman/zev/tar.gz/refs/tags/$_tag")
sha256sums=('df65698442d5ed86e7a77914d046cc1b8ba3f202aa0499b39c7f9de81cea4cf5')

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
