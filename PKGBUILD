# Maintainer: Ainola

pkgbase=python-image
pkgname=('python-image' 'python2-image')
pkgver=1.5.24
pkgrel=2
pkgdesc="Django application that provides editing for images and videos."
arch=('any')
url="https://github.com/francescortiz/image"
license=('BSD')
makedepends=('python-setuptools' 'python-pillow' 'python-requests' 'python-django'
             'python2-setuptools' 'python2-pillow' 'python2-requests' 'python2-django')
optdepends=('ffmpeg: For video thumbnails')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/i/image/image-$pkgver.tar.gz")
sha256sums=('cfe64396b45dd31ff0ea390c80d63728b1df5e311b7c4a907a42f1bdded85515')

prepare() {
    cp -a "image-$pkgver"{,-py2}
}

build() {
    cd "$srcdir/image-$pkgver"     && python setup.py build
    cd "$srcdir/image-$pkgver-py2" && python2 setup.py build
}

package_python-image() {
    depends=('python-pillow' 'python-requests' 'python-django')

    cd "image-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python2-image() {
    depends=('python2-pillow' 'python2-requests' 'python2-django')

    cd "image-$pkgver-py2"
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README -t "$pkgdir/usr/share/licenses/$pkgname/"
}
