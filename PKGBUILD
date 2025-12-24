# Maintainer: Stick <stick@stma.is>
# Contributer: Sherlock Holo <Sherlockya@gmail.com>

_pkg=locust
pkgname="python-$_pkg-git"
pkgver=2.42.6.r31.g3a0fb6d5
pkgrel=1
pkgdesc="Scalable user load testing tool written in Python"
arch=('any')
url="https://github.com/locustio/$_pkg"
license=('MIT')
depends=(
	'python-flask'
	'python-werkzeug'
	'python-requests'
	'python-msgpack'
	'python-pyzmq'
	'python-geventhttpclient'
	'python-configargparse'
	'python-tomli'
	'python-typing_extensions'
	'python-psutil'
	'python-flask-login'
	'python-flask-cors'
	'python-socketio'
	'python-engineio'
	'python-pytest'
)
makedepends=(
	'git'
	'python-hatch'
	'python-hatch-vcs'
	'python-cryptography'
	'python-pyquery'
	'python-retry'
)
provides=("python-$_pkg")
conflicts=("python-$_pkg")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname" || exit
	local _ver
	_ver="$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
	printf '%s\n' "${_ver#v}"
}

build() {
	cd "$pkgname" || exit
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
