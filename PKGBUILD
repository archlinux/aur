# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Christoph Stahl <christoph.stahl@uni-dortmund.de>
# Contributor: Serge Victor <arch@random.re>

_name=flask-apscheduler
pkgname=python-$_name
pkgver=1.13.1
pkgrel=3
pkgdesc='Adds APScheduler support to Flask'
arch=('any')
url="https://github.com/viniciuschiele/$_name"
license=('Apache-2.0')
# upstream implicitly depends on werkzeug:
# https://github.com/viniciuschiele/flask-apscheduler/blob/93cec4e9d90b2d7ee7aef02e5ccb6cf7f6c2cbc9/flask_apscheduler/scheduler.py#L20
depends=('python' 'python-apscheduler' 'python-dateutil' 'python-flask' 'python-werkzeug')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-nose2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('37a0686fb4b598e7bc789fda4f49575e703aac6d6803ad19aa8babc5f76f4d0a')

build() {
  cd "$_name-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"

  nose2 -v
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
