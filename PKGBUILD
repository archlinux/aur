# Maintainer: Hubert "hkk" Batkiewicz <hubert@batkiewi.cz>
pkgname=gamma-launcher
pkgver=2.5
pkgrel=1
pkgdesc="S.T.A.L.K.E.R GAMMA launcher for Linux"
arch=(x86_64)
url="https://github.com/Mord3rca/gamma-launcher"
license=('GPL')
depends=(python python-bs4 python-platformdirs python-py7zr python-unrar python-requests python-tenacity python-tqdm python-magic python-rarfile python-gitpython python-cloudscraper)
makedepends=(git python-pip python-build python-installer python-wheel)
optdepends=(unrar)
provides=(gamma-launcher)
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "$pkgname"
    git checkout tags/v"$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
