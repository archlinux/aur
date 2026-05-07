# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=nnote
pkgver=0.3.1
pkgrel=2
pkgdesc="A minimal CLI note taker"
arch=('any')
url="https://github.com/stiermid/nnote"
license=('GPL-3.0-or-later')
depends=('python' 'python-click' 'python-pyyaml')
makedepends=('uv')
provides=("python-$pkgname")
conflicts=("python-$pkgname")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b34f3d55c6612cd68b3a017dbc46fc022413822732e2d9f6c6bc7dd5c785d596')

build() {
    cd "${pkgname}-${pkgver}"
    uv build --wheel --no-build-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    # python -m installer --destdir="${pkgdir}" dist/*.whl
    uv pip install --system --no-deps --prefix="$pkgdir/usr" dist/*.whl
    rm "$pkgdir/usr/.lock"
}
