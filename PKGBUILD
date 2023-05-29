# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=hpy
pkgver=0.9.0rc2
pkgrel=1
pkgdesc='A better C API for Python'
arch=(any)
url='https://github.com/hpyproject/hpy'
license=('MIT')
depends=('python>=3.8' 'python-setuptools>=64.0')
makedepends=(python-build
             python-installer
             'python-setuptools-scm>=6.0'
             'python-wheel>=0.34.2')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('5145a60d664cbdf75e7cc5a326f677e3d19de10c28b91cc45d3d47a8ab6552e756fb37ca923330259cbfae912c6a6e4d37e9328c689fdecf2d5b04966125b859')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
