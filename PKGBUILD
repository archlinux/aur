# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>

pkgname=python-garminconnect
_name=garminconnect
pkgver=0.2.38
pkgrel=1
pkgdesc="Python 3 API wrapper for Garmin Connect"
url="https://github.com/cyberjunky/python-garminconnect"
license=('MIT')
arch=('any')
depends=('python' 'python-garth')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('53f0d73e821dfa9e93731a6a1c81c34e689ce157c2751edd22dd462d4e4f9e04')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license if available
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
