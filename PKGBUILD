# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-pygments-ansi-color
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc='ANSI color-code highlighting for Pygments'
makedepends=(python-build python-installer python-wheel)
depends=(python python-pygments)
checkdepends=(python-pytest)
license=('Apache')
arch=('any')
source=("https://github.com/chriskuehl/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a1e9f22d7615b42b1efec8d47bb27fbd764d8ba42be14662884fd63de0359c0690c010f8993332548501ac69cac603521e3b120f403b2fa634556e76ca79cf24')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_name-$pkgver"
    pytest
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
