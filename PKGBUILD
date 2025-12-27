pkgname=kpa
pkgver=2.1.0
pkgrel=1
pkgdesc="KevinCrrl Python AUR Helper"
arch=('any')
url="https://github.com/KevinCrrl/kpa"
license=('GPL3-or-later')
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=("cada3bf22142169db759ea8f84a80e3d79693756f4d05fe87a88c8b5be1ad9fd1d83051b9f37077debf69147ceffec1b974082e92cba39a18176095552e8f656")
conflicts=('kpa-bin')
depends=(
    'python'
    'python-pyxdg'
    'python-jsonschema'
    'python-colorama'
    'python-pkgbuild-parser'
    'python-requests'
    'git'
    'base-devel'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
optdepends=(
    'sudo'
    'proxychains-ng'
)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
