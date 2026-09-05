# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-sclack-git
_pkgname=sclack-git
pkgver=r301.da75272
pkgrel=1
pkgdesc="A Slack client for your terminal"
arch=('any')
url="https://github.com/haskellcamargo/sclack"
license=('GPL-3.0-or-later')
depends=('python' 'python-slackclient' 'python-urwid' 'python-websocket-client')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('sclack')
conflicts=('sclack')
source=("sclack::git+https://github.com/haskellcamargo/sclack.git")
sha256sums=('SKIP')

pkgver() {
	cd sclack
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd sclack
	rm -rf dist
	python -m build --wheel --no-isolation
}

package() {
	cd sclack
	python -m installer --destdir="$pkgdir" dist/*.whl
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
