# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-snowplow-tracker
pkgver=1.1.0
pkgrel=1
pkgdesc="Snowplow event tracker for Python. Add analytics to Python apps, webapps and games."
arch=('any')
url="https://github.com/snowplow/snowplow-python-tracker"
license=('Apache')
makedepends=("python-setuptools" "python-pytest" "python-freezegun")
depends=("python" "python-requests" "python-typing_extensions")
optdepends=(
    "python-celery: "
    "python-redis: "
)
_name=snowplow-python-tracker
source=("$pkgname-$pkgver.tar.gz::https://github.com/snowplow/$_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('91609b1e8e105b3690c6245338bbfb6c25fd41c6823170a688a5189a92dc6ba3')

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
