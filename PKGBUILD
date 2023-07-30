# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=python-dotmap
_name=dotmap
pkgver=1.3.30
pkgrel=2
pkgdesc="Ordered, dynamically-expandable dot-access dictionary"
arch=('any')
url="https://github.com/drgrib/dotmap"
license=('MIT')
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        fix-setup.cfg.patch)
sha256sums=('5821a7933f075fb47563417c0e92e0b7c031158b4c9a6a7e56163479b658b368'
            'b2f1d6972fbd169684f36c4958f7167c81a85d4aab126c11d1fcad1bfbc121ee')

prepare() {
    cd "$_name-$pkgver"
    patch -p1 < "$srcdir"/fix-setup.cfg.patch
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
