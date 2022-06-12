# Maintainer: Gianluca Mascolo <gianluca@gurutech.it>

makedepends=(python-build python-installer python-poetry python-pytest)
depends=(python python-yaml python-gobject python-pyotp gtk3 sops)
source=('https://github.com/gianluca-mascolo/otpgui/archive/refs/tags/0.1.0.tar.gz')
sha256sums=('bdc0bdd5bae7e16a7e83db359ed1b2f4eea299ff8e5ef30c52034587b8b67a19')
pkgname=otpgui
pkgver=0.1.0
arch=('any')
license=('GPL')
pkgrel=1
build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check(){
    cd "$srcdir/$pkgname-$pkgver"
    pytest
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
