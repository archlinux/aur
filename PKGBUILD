# Maintainer: Ainola

pkgname=python-image-git
pkgver=r159.3e91ddf
pkgrel=2
pkgdesc="Django application that provides editing for images and videos."
arch=('any')
url="https://github.com/francescortiz/image"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-pillow' 'python-requests' 'python-django')
provides=('python-image')
conflicts=('python-image')
source=("git+https://github.com/francescortiz/image.git")
sha256sums=('SKIP')

pkgver() {
    cd image
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd image
    python setup.py build
}

package() {
    cd image
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.markdown -t "$pkgdir/usr/share/licenses/$pkgname/"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
