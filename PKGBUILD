# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=moderngl
pkgname=python-$_name
pkgver=5.7.2
pkgrel=1
pkgdesc='ModernGL: High performance rendering for Python 3'
arch=(x86_64)
url='https://github.com/moderngl/moderngl'
license=('MIT')
depends=(python python-glcontext)
# For python-setuptools, see here: https://aur.archlinux.org/packages/python-moderngl#comment-864201.
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('8892aee27d8df6a2477ce5568b24cd11536ab7a7abec6b74fa742053f5822ee18b19b1160c0c215267337a9c7e73dac8b6797f72284835e9f171e0cfee2a1156')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
