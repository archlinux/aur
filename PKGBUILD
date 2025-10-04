# Maintainer: Wojtmic <mail at wojtmic dot dev>

pkgname=prefixer
pkgdesc="Modern Proton Prefix management tool"

pkgver=1.1.0
pkgrel=3

arch=('any')

url="https://github.com/wojtmic/prefixer"
license=('GPL3')

depends=('python>3.13' 'python-vdf' 'python-json5' 'python-requests' 'python-click')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wojtmic/prefixer/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ccbb62fe8720b52be71e18a03a50b09448c3239b05a7ab6d554debdd7cd2fea3')

build() {
  cd "$srcdir"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"
  python -m installer --destdir="$pkgdir" dist/*.whl

  mkdir -p $pkgdir/usr/share/prefixer/tweaks
  install -Dm644 $srcdir/prefixer/data/tweaks/* $pkgdir/usr/share/prefixer/tweaks
}
