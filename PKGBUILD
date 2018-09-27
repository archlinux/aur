# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>

pkgname=('python2-deepgaze-git')
_module='deepgaze'
pkgver=r219.1e47588
pkgrel=1
pkgdesc="Head pose and Gaze estimation with Convolutional Neural Networks"
url="https://github.com/mpatacchiola/deepgaze"
depends=('python2' 'opencv' 'python2-numpy')
optdepends=('tensorflow')
makedepends=('python2-setuptools')
license=('MIT')
arch=('any')
source=("git+https://github.com/mpatacchiola/deepgaze.git")
md5sums=('SKIP')
pkgver() {
    cd "$srcdir/${_module}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_module}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    cd "${srcdir}/${_module}"
    mkdir -p "$pkgdir/usr/share/doc/${_module}/"
    cp -r doc/images "$pkgdir/usr/share/doc/${_module}/"
    cp -r examples "$pkgdir/usr/share/doc/${_module}/"

# TODO: copy etc/tensorflow to pkgdir

}
