# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=python-aio-mqtt-mod-git
_gitname=aio-mqtt
pkgver=r10.c9473b3
pkgrel=1
pkgdesc='Asynchronous MQTT client for 3.1.1 protocol version (devbis fork)'
url='https://github.com/devbis/aio-mqtt'
arch=('any')
license=('Apache-2.0')
depends=()
makedepends=('git' 'python-build' 'python-setuptools' 'python-installer' 'python-wheel')
conflicts=('python-aio-mqtt-mod-git' 'python-aio-mqtt-mod' 'python-aio-mqtt')
provides=('python-aio-mqtt-mod')
source=('git+https://github.com/syyyr/aio-mqtt.git#branch=makepkg')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_gitname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
