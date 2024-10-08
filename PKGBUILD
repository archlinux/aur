# Contributor: Lex Black <autumn-wind@web.de>

pkgname=greenbone-feed-sync
pkgver=24.9.0
pkgrel=1
pkgdesc='script for downloading the Greenbone Community Feed'
arch=('any')
url="https://github.com/greenbone/greenbone-feed-sync"
license=('GPL-3.0-only')
depends=('rsync' 'python-rich' 'python-tomli' 'python-shtab')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        ${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc)
sha512sums=('97ff2abd1ee604893546e6f4befceb70ec496e83f1920da8820c4c1de1dc8f12301aaac6030d68a19a3eeb7bd0dd143941693d8f986a7748e6bc0c463deae0bb'
            'SKIP')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity


build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

