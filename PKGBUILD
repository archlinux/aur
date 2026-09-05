# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-procmux-git
_pkgname=procmux-git
pkgver=r133.3fc3aef
pkgrel=1
pkgdesc="A TUI utility for running multiple commands in parallel"
arch=('any')
url="https://github.com/napisani/procmux"
license=('MIT')
depends=('python' 'python-pyyaml' 'python-blessed' 'python-libtmux')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('procmux')
conflicts=('procmux')
source=("procmux::git+https://github.com/napisani/procmux.git")
sha256sums=('SKIP')

pkgver() {
	cd procmux
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd procmux
	python -m build --wheel --no-isolation
}

package() {
	cd procmux
	python -m installer --destdir="$pkgdir" dist/*.whl
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
