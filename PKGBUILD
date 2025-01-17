# Maintainer: 3j14 <hello@3j14.de>

pkgname=bumgr
pkgver=0.5.1
pkgrel=4
pkgdesc='Bumgr Backup Manager for Restic'
arch=('any')
url='https://pypi.org/project/bumgr/'
license=('BSD-3-Clause')
depends=('python' 'python-rich' 'restic')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-$pkgver.tar.gz" "${pkgname}@.service" "${pkgname}@.timer")
sha256sums=('28c1738516f186dca7a0e520c82030f1fb8609c7b7d55283e63409b18619a96a' 'SKIP' 'SKIP')
build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    install -Dm644 "${pkgname}@.service" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${pkgname}@.timer" -t "${pkgdir}/usr/lib/systemd/user"

    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
