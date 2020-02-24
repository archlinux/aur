# Maintainer: TankMissile <alecfeldman at disroot dot org>
# Contributor: portaloffreedom <matteo dot dek at gmail dot com>

_pkgsrcname="pulsectl"
_pkgname="python-pulse-control"
_pkgname2="python2-pulse-control"
pkgname=($_pkgname $_pkgname2)
pkgver=20.2.2
pkgrel=1
pkgdesc="Python high-level interface and ctypes-based bindings for PulseAudio."
url="http://github.com/mk-fg/$_pkgname"
license=("MIT")
arch=("any")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.io/packages/source/${_pkgsrcname::1}/$_pkgsrcname/$_pkgsrcname-$pkgver.tar.gz")
md5sums=("b6ec1fd903e8bbaebc06e0c257c9dc53")

prepare() {
	mv $_pkgsrcname-$pkgver $_pkgname-$pkgver
	cp -r $_pkgname-$pkgver $_pkgname2-$pkgver
}

build() {
	cd $_pkgname-$pkgver
	python setup.py build
	cd ../$_pkgname2-$pkgver
	python2 setup.py build
}

package_python-pulse-control() {
	depends=("python" "pulseaudio")
	cd $_pkgname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-pulse-control() {
	depends=("python2" "pulseaudio")
	cd $_pkgname2-$pkgver
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
