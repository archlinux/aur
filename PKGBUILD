# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tully Foote <tfoote@osrfoundation.org>

pkgname=python-rocker-git
_pkgname="${pkgname%-git}"
_pkg="${_pkgname#python-}"
pkgver=0.2.10.r14.g434d9df
pkgrel=1
pkgdesc='A tool to run Docker containers with customized extras'
arch=('any')
url='https://github.com/osrf/rocker'
license=('Apache')
depends=('python-docker' 'python-empy' 'python-packaging' 'python-pexpect' 'python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=("$_pkgname=${pkgver%.r*}")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
