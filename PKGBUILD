# Maintainer: Wojtmic <mail at wojtmic dot dev>

pkgname=prefixer
pkgdesc="Modern Proton Prefix management tool"

pkgver=1.0.0
pkgrel=1


arch=('any')

url="https://github.com/wojtmic/prefixer"
license=('GPL3')

depends=('python>3.13')
makedepends=('python-build' 'python-installer' 'python-wheel')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wojtmic/prefixer/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d58416be7fda9143860394746d541cb583b4fa77ef4bec13d462d2e30cae559c')

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
