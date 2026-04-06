# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=nnote
pkgver=0.1.1
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
sha256sums=('80abc8fb1e6252dd81e165e63f81c64fcb149a4afdba016cd869c1a8d2907125')

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
