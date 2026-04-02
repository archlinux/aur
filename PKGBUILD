# Maintainer: Lu Xu <oliver_lew at outlook dot com>
pkgname=python-psrqpy
_name=${pkgname#python-}
pkgver=1.3.2
pkgrel=1
pkgdesc="A python module to query the ATNF pulsar catalogue"
arch=(any)
url="https://github.com/mattpitkin/psrqpy"
license=('MIT')
depends=(
    "python-requests"
    "python-beautifulsoup4"
    "python-numpy"
    "python-scipy"
    "python-astropy"
    "python-pandas"
    "python-ads"
    "python-matplotlib"
    "python-appdirs"
)
optdepends=("python-pytest")
makedepends=("python-setuptools")
conflicts=("${pkgname}-git")
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(a9446891447d46555134793ccfed40f156b8bbab2ba1b3d1fe7750b2a6e36667)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
    cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
