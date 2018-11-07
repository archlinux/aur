# Maintainer: Ainola

pkgbase=python-image-git
pkgname=(python-image-git python2-image-git)
pkgver=r162.bf98fbc
pkgrel=4
pkgdesc="Django application that provides editing for images and videos."
arch=('any')
url="https://github.com/francescortiz/image"
license=('BSD')
makedepends=('python-setuptools' 'python-pillow' 'python-requests' 'python-django'
             'python2-setuptools' 'python2-pillow' 'python2-requests' 'python2-django' 'git')
optdepends=('ffmpeg: For video thumbnails')
source=("git+https://github.com/francescortiz/image.git")
sha256sums=('SKIP')

pkgver() {
    cd image
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cp -a image{,-py2}
}

build() {
    cd image && python setup.py build
    cd ../image-py2 && python2 setup.py build
}

package_python-image-git() {
    depends=('python-pillow' 'python-requests' 'python-django')
    provides=('python-image')
    conflicts=('python-image')
    cd image
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.markdown -t "$pkgdir/usr/share/licenses/$pkgname/"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-image-git() {
    depends=('python2-pillow' 'python2-requests' 'python2-django')
    provides=('python2-image')
    conflicts=('python2-image')
    cd image-py2
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.markdown -t "$pkgdir/usr/share/licenses/$pkgname/"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
