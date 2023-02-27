# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=moderngl
pkgname=python-$_name
pkgver=5.8.1
pkgrel=1
pkgdesc='ModernGL: High performance rendering for Python 3'
arch=(x86_64)
url='https://github.com/moderngl/moderngl'
license=('MIT')
depends=(python python-glcontext)
# For python-setuptools, see here: https://aur.archlinux.org/packages/python-moderngl#comment-864201.
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('f3ad776eb8d8cbba03f4719b039f729d9e33df85d562aeceb4ab050b8d92cf5bcce3ca349ac77c179c320a116060daad81ceb13bc60ce6b4b480ca3cc3d6281d')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
