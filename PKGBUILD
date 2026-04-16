# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=nnote
pkgver=0.1.3
pkgrel=1
pkgdesc="A minimal CLI note taker"
arch=('any')
url="https://github.com/stiermid/nnote"
license=('GPL-3.0-or-later')
depends=('python' 'python-click' 'python-pyyaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
provides=("python-$pkgname")
conflicts=("python-$pkgname")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('343c592695d018e824617672a777531636bceed3d72798fd6fdac6bdac132111')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}-${pkgver}"
    PYTHONPATH="$PWD" pytest
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
