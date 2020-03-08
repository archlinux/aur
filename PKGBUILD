# Maintainer: TankMissile <alecfeldman@disroot.org>
# Contributor: portaloffreedom <matteo.dek@gmail.com>

_pkgsrcname="pulsectl"
_pkgname="python-pulse-control"
_pkgname2="python2-pulse-control"
pkgname=($_pkgname $_pkgname2)
pkgver=20.2.4
pkgrel=1
pkgdesc="Python high-level interface and ctypes-based bindings for PulseAudio."
url="http://github.com/mk-fg/$_pkgname"
license=("MIT")
arch=("any")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.io/packages/source/${_pkgsrcname::1}/$_pkgsrcname/$_pkgsrcname-$pkgver.tar.gz")
md5sums=("07d7a5fddc49f5da22634464aa008003")

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
