# Maintainer: Wojtmic <mail at wojtmic dot dev>

pkgname=prefixer
pkgdesc="Modern Proton Prefix management tool"

pkgver=1.0.0
pkgrel=2

arch=('any')

url="https://github.com/wojtmic/prefixer"
license=('GPL3')

depends=('python>3.13')
makedepends=('python-build' 'python-installer' 'python-wheel')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wojtmic/prefixer/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6fa6671d7605195060402672296dca7bcc0b917c1afe2fc0c987a68753c7c32d')

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
