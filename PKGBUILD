# Maintainer: TankMissile <alecfeldman@disroot.org>
# Contributor: ahrs <forward.to@hotmail.co.uk>

_pkgname=python-pulse-control
_pkgname2=python2-pulse-control
pkgname=($_pkgname-git $_pkgname2-git)
pkgver=r193.344b6b6
pkgrel=1
pkgdesc="Python high-level interface and ctypes-based bindings for PulseAudio (git version)."
url="http://github.com/mk-fg/$_pkgname"
arch=("any")
license=("MIT")
makedepends=("python-setuptools" "python2-setuptools")
source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -r $_pkgname $_pkgname2
}

build() {
  cd $_pkgname
  python setup.py build
  cd ../$_pkgname2
  python2 setup.py build
}

package_python-pulse-control-git() {
  depends=("python" "pulseaudio")
  provides=("python-pulse-control")
  conflicts=("python-pulse-control")
  cd $_pkgname
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-pulse-control-git() {
  depends=("python2" "pulseaudio")
  provides=("python2-pulse-control")
  conflicts=("python2-pulse-control")
  cd $_pkgname2
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
