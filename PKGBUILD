# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=nnote
pkgver=0.3.2
pkgrel=1
pkgdesc="A minimal CLI note taker"
arch=('any')
url="https://github.com/stiermid/nnote"
license=('GPL-3.0-or-later')
depends=('python' 'python-click' 'python-pyyaml')
makedepends=('uv')
provides=("python-$pkgname")
conflicts=("python-$pkgname")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c7e45346a6a8dca55c641d6d02d9b431a65430bcb11c781b02401bbb3ec311c7')

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
