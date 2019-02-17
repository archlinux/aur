# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=wispr
pkgver=1.0
pkgrel=3
pkgdesc="Simple command-line tool to authenticate against a WISPr server"
url="https://github.com/wichert/wispr"
arch=('any')
license=('custom')
depends=('python')
source=(
  'https://github.com/wichert/wispr/archive/release/1.0.tar.gz'
  'python3.patch'
  'timeout.patch'
)
sha256sums=(
  'ba9994abee90d51c9d65fbb61241694a610a0198c5c4a833f8d7bf9c346ebd41'
  '7f14a07b35f7625b90163352ef943d225ef4ba01a5aa172e67174157e1b4b2cf'
  '0cc5f11d022ff3c560f71ce7c7269dd55a50a31ba1ee9c230e0405801b777eb5'
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
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
