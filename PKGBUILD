# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=nnote
pkgver=0.3.0
pkgrel=1
pkgdesc="A minimal CLI note taker"
arch=('any')
url="https://github.com/stiermid/nnote"
license=('GPL-3.0-or-later')
depends=('python' 'python-click' 'python-pyyaml' 'python-shellingham')
makedepends=('uv')
provides=("python-$pkgname")
conflicts=("python-$pkgname")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d9f7d3c486a6df5a14b0204f454d756e28ae380a4dc6f82b6855a5211bc6e4a1')

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
