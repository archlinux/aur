# Maintainer: Joao Freitas <joaj dot freitas at gmail dot com>

pkgname=marcador
pkgver=0.5.0
pkgrel=1
pkgdesc='Lightweight bookmark manager with rofi integration'
arch=('any')
url='https://pypi.org/project/marcador'
license=('GPLv3')
depends=('python' 'python-clipboard' 'python-click' 'python-serde' 'python-appdirs')
optdepends=()
makedepends=('python-build' 'python-installer' 'python-wheel' 'poetry')
provides=('marcador')
source=("https://github.com/joajfreitas/marcador/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ce07b95f7f2fc018c55cab45bc90a26d5a4aa8505490cae80664d78cd998261a')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D --mode=644 ${srcdir}/$pkgname-$pkgver/systemd/marcador.service ${pkgdir}/usr/lib/systemd/user/marcador.service
}
