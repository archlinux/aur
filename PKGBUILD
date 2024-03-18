# Maintainer: avi <4visekh@gmail.com>
pkgname=python-materialyoucolor-git
_name=materialyoucolor-python
pkgver=v2.0.7.r5.g1dd2f05
pkgrel=1
pkgdesc="Material You color algorithms for Python!"
arch=('x86_64')
url="https://github.com/T-Dynamos/materialyoucolor-python"
license=('MIT')
depends=('glibc' 'gcc-libs' 'python' 'python-pillow')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
    cd $_name
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
