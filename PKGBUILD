# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-vine
pkgver=5.1.0
pkgrel=7
pkgdesc="Python promises"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/celery/vine"
depends=(
    'python'
)
makedepends=(
    'python-setuptools'
    'python-build'
    'python-installer'
    'python-wheel'
    'git'
)
checkdepends=(
    'python-pytest'
)
source=(
    "$pkgname-$pkgver::git+$url.git#tag=v$pkgver"
    "fix-removed-setup-method.patch"
)
b2sums=('72aca5038faf4158fe4f3669cc48d096f1477d905725ea08f16c7ce6a9f24df02adf1f21cb13389e6e6b621ff3d191a3a652d3e3275c675647c70316d0ab0934'
        'cae703dc329a1bf4bbf10fb890509550aff10c8586eba6b3f8d82a6b5662e030ea7e10a872e6e2d8d015e8305b615ba8cd026377c255f3e3ebee0899409734e8')

prepare() {
    cd $pkgname-$pkgver
    patch --forward --strip 1 --input ../fix-removed-setup-method.patch
}

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $pkgname-$pkgver
    pytest
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
