# Maintainer: KevinCrrl

pkgname=kpa
pkgver=2.2.0
pkgrel=1
pkgdesc="KevinCrrl Python AUR Helper"
arch=('any')
url="https://github.com/KevinCrrl/kpa"
license=('GPL3-or-later')
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=("e880ff3e2ad47bdfc74f6fcddd9289540d968c4b2790bbbadf3a89671a36015e95ab31272a60f6f823b60fe21962daf93be816a134400412fd8d0fd7a53685bb")
conflicts=('kpa-bin')
depends=(
    'python'
    'python-pyxdg'
    'python-jsonschema'
    'python-colorama'
    'python-pkgbuild-parser'
    'python-requests'
    'python-typer'
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
