# Maintainer: Wojtmic <mail at wojtmic dot dev>

pkgname=prefixer
pkgdesc="Modern Proton Prefix management tool"

pkgver=1.2.0
pkgrel=3

arch=('any')

url="https://github.com/wojtmic/prefixer"
license=('GPL3')

depends=('python>3.13' 'python-vdf' 'python-json5' 'python-requests' 'python-click')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wojtmic/prefixer/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ce2810f18945d4c672cd8c65fa34799f077032a6ba8458da410bd718105fef6f')

build() {
  cd "$srcdir/prefixer-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/prefixer-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  mkdir -p $pkgdir/usr/share/prefixer/tweaks
  install -Dm644 $srcdir/prefixer-${pkgver}/prefixer/data/tweaks/* $pkgdir/usr/share/prefixer/tweaks
}
