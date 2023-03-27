# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=moderngl
pkgname=python-$_name
pkgver=5.8.2
pkgrel=1
pkgdesc='ModernGL: High performance rendering for Python 3'
arch=(x86_64)
url='https://github.com/moderngl/moderngl'
license=('MIT')
depends=(python python-glcontext)
# For python-setuptools, see here: https://aur.archlinux.org/packages/python-moderngl#comment-864201.
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('9a04c9e7554cb0e96ad497edc0fb9ee533f8a9b9399cd13e6e4a8546a22d626fde0165fdf7e888b9b55ca4ad3bc010ccf6d20904f64ac233b34b32af8d035b72')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
