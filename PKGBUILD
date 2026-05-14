# Maintainer: Miodrag Tokić

pkgname=python-clickdc
pkgver=0.1.1
pkgrel=1
pkgdesc='Manage click arguments using python dataclass'
arch=('any')
url='https://github.com/Kamilcuk/clickdc'
license=('MIT')
depends=(
    'python'
    'python-click'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
options=(!emptydirs)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Kamilcuk/clickdc/archive/refs/tags/${pkgver}.tar.gz"
    'pyproject.toml.patch'
)
sha256sums=(
    '0263e384379bab0134b9b1ebd7257da93f27208ab9c07f1e0b07bb924fda4f20'
    'b2700feca37bd67e29d4a7d5d31b84cb96b641eac02b3c4d9a46eb0ba94edd59'
)

prepare() {
    cd "$srcdir/clickdc-${pkgver}"
    patch -N -p1 -i "$srcdir/pyproject.toml.patch"
}

build() {
    cd "$srcdir/clickdc-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/clickdc-${pkgver}"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
