# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-pygments-ansi-color
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
url='https://github.com/chriskuehl/pygments-ansi-color'
pkgdesc='ANSI color-code highlighting for Pygments'
makedepends=(python-build python-installer python-wheel)
depends=(python python-pygments)
checkdepends=(python-pytest)
license=('Apache')
arch=('any')
source=("https://github.com/chriskuehl/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('51847dd13fe3c8905d185766fa84037b4373fe7fd384273a08aa8261df44c4263d9364adb68836c8ed0c76af0e5bf01c3e587ebe90b6c14d32953622d288f6d8')

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
    python -m installer --destdir="$pkgdir" dist/pygments_ansi_color-${pkgver}-py3-none-any.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
