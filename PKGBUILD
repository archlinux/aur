# Maintainer: pjvm <pjvm742@disroot.org>

pkgname=python-farama-notifications
_name=Farama-Notifications
pkgver=0.0.4
pkgrel=2
pkgdesc="Notices from the Farama Foundation; given as a dependency for all of their packages."
arch=('any')
url="https://github.com/Farama-Foundation/Farama-Notifications"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz" "https://raw.githubusercontent.com/Farama-Foundation/$_name/$pkgver/LICENSE")
sha256sums=('13fceff2d14314cf80703c8266462ebf3733c7d165336eee998fc58e545efd18' # from PyPI
            '7ff6336b33ae4c168086e899a11b7c91d369b6758cee20f9469d563f004f89eb')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
