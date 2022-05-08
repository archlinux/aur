# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=moderngl
pkgname=python-$_name
pkgver=5.6.4
pkgrel=2
pkgdesc='ModernGL: High performance rendering for Python 3'
arch=(x86_64)
url='https://github.com/moderngl/moderngl'
license=('MIT')
depends=(python)
# For python-setuptools, see here: https://aur.archlinux.org/packages/python-moderngl#comment-864201.
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8c6d04559f5e3bf75a18525cd46d213c0f3a8409363718978e6de691bdb551fb')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
