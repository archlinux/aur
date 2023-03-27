# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-snowplow-tracker
pkgver=0.14.0
pkgrel=1
pkgdesc="Snowplow event tracker for Python. Add analytics to Python apps, webapps and games."
arch=('any')
url="https://github.com/snowplow/snowplow-python-tracker"
license=('Apache')
makedepends=("python" "python-pytest" "python-freezegun")
depends=("python" "python-requests" "python-typing_extensions")
optdepends=(
    "python-celery: "
    "python-redis: "
)
_name=snowplow-python-tracker
source=("$pkgname-$pkgver.tar.gz::https://github.com/snowplow/$_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2fe5f3a46f3a938cc2d2c08e061e70662a985bdfe4bc1b0be8b2664b65c97695')

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

check() {
    cd $_name-$pkgver
    pytest snowplow_tracker/test/unit
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
