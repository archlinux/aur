# Maintainer: Nimrod <nimrod4garoa@gmail.com>
# Inspired from python-yaml PKGBUILD

_name=pyPicoSDK
pkgname=python-pypicosdk-git
pkgver=1.7.5.r6.g2ad6ac4
pkgrel=1
pkgdesc='Python bindings for PicoSDK to work with Picoscopes'
arch=(x86_64)
url='https://github.com/picotech/pyPicoSDK'
license=(ISC)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-hatchling
  git
)
source=("git+$url")
sha512sums=(SKIP)


pkgver() {
  cd "$_name"
  git describe --tags --long --abbrev=7 | cut -c2- | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

