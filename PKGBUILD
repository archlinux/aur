# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=nnote
pkgver=0.2.0
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
sha256sums=('a671df5a0620292ce4a5c14861789e48b01e460f22430c921c98087015768ffc')

build() {
    cd "${pkgname}-${pkgver}"
    uv build --wheel --no-build-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    # python -m installer --destdir="${pkgdir}" dist/*.whl
    uv pip install --system --no-deps --prefix="$pkgdir/usr" dist/*.whl
}
