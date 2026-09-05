# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-llmtop-git
_pkgname=llmtop-git
pkgver=r16.67aeacf
pkgrel=1
pkgdesc="System monitor (like top/htop) with LLM-generated natural-language insights"
arch=('any')
url="https://github.com/arinbjornk/llmtop"
license=('MIT')
depends=('python' 'python-psutil' 'python-openai' 'python-rich')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('llmtop')
conflicts=('llmtop')
source=("llmtop::git+https://github.com/arinbjornk/llmtop.git")
sha256sums=('SKIP')

pkgver() {
	cd llmtop
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd llmtop
	python -m build --wheel --no-isolation
}

package() {
	cd llmtop
	python -m installer --destdir="$pkgdir" dist/*.whl
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
