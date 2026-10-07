# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-restbook-git
_pkgname=restbook-git
pkgver=r142.2a60861
pkgrel=2
pkgdesc="Orchestrate complex API workflows using YAML playbooks"
arch=('any')
url="https://github.com/shalev007/restbook"
license=('LicenseRef-unknown')
depends=('python' 'python-aiohttp' 'python-pyyaml' 'python-jsonpath-ng')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('restbook')
conflicts=('restbook')
source=("restbook::git+https://github.com/shalev007/restbook.git")
sha256sums=('SKIP')

pkgver() {
	cd restbook
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd restbook
	python -m build --wheel --no-isolation
}

package() {
	cd restbook
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -d "$pkgdir/usr/share/doc/$_pkgname/docs" "$pkgdir/usr/share/$_pkgname/examples"
	cp -r docs/. "$pkgdir/usr/share/doc/$_pkgname/docs/"
	install -Dm644 examples/*.yml "$pkgdir/usr/share/$_pkgname/examples/"
	install -Dm644 assets/demo.gif "$pkgdir/usr/share/doc/$_pkgname/demo.gif"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
