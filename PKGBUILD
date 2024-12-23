# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
pkgname=python-plottable
_name=${pkgname#python-}
pkgver=0.1.5
pkgrel=2
pkgdesc="Beautifully customized tables with matplotlib"
arch=('any')
url="https://github.com/znstrider/plottable"
license=('MIT')
depends=('python' 'python-matplotlib' 'python-numpy' 'python-pandas' 'python-pillow')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('235d762a31c82129dc5bf74205c103a14b1e4393d0f921cc0231be5de884041d')

build() {
    cd $_name-$pkgver
    python setup.py build
}

check() {
    cd $_name-$pkgver
    pytest
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

    # Remove tests
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    rm -rf "$pkgdir/$_site_packages/tests"
}
