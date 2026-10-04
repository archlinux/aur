# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-procmux-git
_pkgname=procmux-git
pkgver=r133.3fc3aef
pkgrel=2
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
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 demo.gif "$pkgdir/usr/share/doc/$_pkgname/demo.gif"
	install -d "$pkgdir/usr/share/$_pkgname/examples"
	install -Dm644 procmux.yaml "$pkgdir/usr/share/$_pkgname/examples/procmux.yaml"
	install -Dm644 procmux.override.yaml "$pkgdir/usr/share/$_pkgname/examples/procmux.override.yaml"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
