# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=moderngl
pkgname=python-$_name
pkgver=5.7.1
pkgrel=1
pkgdesc='ModernGL: High performance rendering for Python 3'
arch=(x86_64)
url='https://github.com/moderngl/moderngl'
license=('MIT')
depends=(python python-glcontext)
# For python-setuptools, see here: https://aur.archlinux.org/packages/python-moderngl#comment-864201.
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('2fdca588b4abe11373496288f80367e8c16ac232410ac0b4061f26f458de7713b32ffd517bdeaf23a9c47b5f249a4788a428bba5fe54e86d9996daafa6f91b1b')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
