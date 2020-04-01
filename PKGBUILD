# Maintainer: Mario O.M. <marioortizmanero@gmail.com>
pkgname=python-tekore
pkgver=1.5.0
pkgrel=1
pkgdesc="Client for the Spotify Web API"
arch=("any")
url="https://github.com/felix-hilden/tekore"
license=("custom:MIT")
depends=("python>=3.7" "python-requests>=2.19" "python-httpx")
makedepends=("python-setuptools")
source=("https://github.com/felix-hilden/tekore/archive/v$pkgver.tar.gz"
        "httpx-version.patch")
md5sums=('d4ad4959e01707f01dc58fa6bb06d005'
         '80e25233bdef4bafb9cc5e34e6b2a39d')

prepare() {
    cd "tekore-$pkgver"
    patch --forward --strip=1 --input="$srcdir/httpx-version.patch"
}

build() {
    cd "tekore-$pkgver"
    python setup.py build
}

package() {
    cd "tekore-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
