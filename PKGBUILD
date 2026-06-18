# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-bugsnag
pkgver=4.9.1
pkgrel=1
pkgdesc='Official bugsnag error monitoring and error reporting for various python apps.'
arch=('any')
url='https://github.com/bugsnag/bugsnag-python'
license=('MIT')
depends=('python-webob')
optdepends=(
    'python-flask: Flask integration'
    'python-blinker: Flask integration')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f872478cd1232d8f00b631556e1344f64be219549cc63ff280cd8c8ab5518b6a')

build() {
    cd "bugsnag-python-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "bugsnag-python-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s \
        "$_site/bugsnag-$pkgver.dist-info/licenses/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
