# Maintainer: Joao Freitas <joaj dot freitas at gmail dot com>

pkgname=marcador
pkgver=0.5.2
pkgrel=1
pkgdesc='Lightweight bookmark manager with rofi integration'
arch=('any')
url='https://pypi.org/project/marcador'
license=('GPLv3')
depends=('python' 'python-clipboard' 'python-click' 'python-serde' 'python-appdirs' 'python-toml')
optdepends=()
makedepends=('python-build' 'python-installer' 'python-wheel' 'poetry')
provides=('marcador')
source=("https://github.com/joajfreitas/marcador/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('89ecd8e8a54a4d0e8a0dcdcc6ad9b8542385a5126005d5f5ed02537cb53b2652')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D --mode=644 ${srcdir}/$pkgname-$pkgver/systemd/marcador.service ${pkgdir}/usr/lib/systemd/user/marcador.service
}
