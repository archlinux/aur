# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-securo-git
_pkgname=securo-git
pkgver=r7.5920acb
pkgrel=1
pkgdesc="Encrypt and decrypt files/folders with symmetric encryption"
arch=('any')
url="https://github.com/iunary/securo"
license=('MIT')
depends=('python' 'python-cryptography')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('securo')
conflicts=('securo')
source=("securo::git+https://github.com/iunary/securo.git")
sha256sums=('SKIP')

pkgver() {
	cd securo
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd securo
	python -m build --wheel --no-isolation
}

package() {
	cd securo
	python -m installer --destdir="$pkgdir" dist/*.whl
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
