# Maintainer: Wojtmic <mail at wojtmic dot dev>

pkgname=prefixer
pkgdesc="Modern Proton Prefix management tool"

pkgver=1.0.1
pkgrel=1

arch=('any')

url="https://github.com/wojtmic/prefixer"
license=('GPL3')

depends=('python>3.13')
makedepends=('python-build' 'python-installer' 'python-wheel')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wojtmic/prefixer/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('20431e734e410f022e5d6edcbc555bd0f1966f06162903d90ee68c117380141a')

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
