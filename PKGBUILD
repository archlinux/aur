# Maintainer: Joao Freitas <joaj dot freitas at gmail dot com>

pkgname=marcador
pkgver=0.5.3
pkgrel=1
pkgdesc='Lightweight bookmark manager with rofi integration'
arch=('any')
url='https://pypi.org/project/marcador'
license=('GPLv3')
depends=('python' 'python-clipboard' 'python-click' 'python-serde' 'python-appdirs' 'python-toml' 'python-requests')
optdepends=()
makedepends=('python-build' 'python-installer' 'python-wheel' 'poetry')
provides=('marcador')
source=("https://github.com/joajfreitas/marcador/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('74523b3d715c347e97bdc62091e4494e36f7793dcde5a6106cea135825fa637c')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D --mode=644 ${srcdir}/$pkgname-$pkgver/systemd/marcador.service ${pkgdir}/usr/lib/systemd/user/marcador.service
}
