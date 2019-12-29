# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=wispr
pkgver=1.0
pkgrel=4
pkgdesc="Simple command-line tool to authenticate against a WISPr server"
url="https://github.com/wichert/wispr"
arch=('any')
license=('custom')
depends=(python)
makedepends=(python-setuptools)
source=(
  "wispr-${pkgver}.tar.gz::https://github.com/wichert/wispr/archive/release/${pkgver}.tar.gz"
  'python3.patch'
  'timeout.patch'
)
sha256sums=(
  'ba9994abee90d51c9d65fbb61241694a610a0198c5c4a833f8d7bf9c346ebd41'
  '191677eac9a175c56cff40f7e41843e21660be2de5be3aab2c926d0f3f7bf6e6'
  '2af11c057fceb909cfecbd08a63fcd8efcfa4fe6f94c70dc5e897b4d47435ec8'
)

prepare() {
    cd "wispr-release-$pkgver"
    patch -Np1 -i "${srcdir}/python3.patch"
    patch -Np1 -i "${srcdir}/timeout.patch"
}

build() {
    cd "wispr-release-$pkgver"
    python setup.py build
}

package() {
    cd "wispr-release-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
