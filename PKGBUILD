# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-cotyledon
pkgver=2.1.0
pkgrel=1
pkgdesc="Cotyledon provides a framework for defining long-running services. "
arch=(any)
url="https://github.com/sileht/cotyledon"
license=('Apache-2.0')
depends=(
    'python'
    'python-oslo-config'
    'python-setproctitle'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('5ff295bc0cc2fccecb02721f383648becb8d4d01bc0185281cad853cf485d1e8ac3262a12fbbf21fd5ece8be827d408ba7f1ae0dc9edb0ea1cc754fed75b535a')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver" || exit
    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/$pkgname/"
}
