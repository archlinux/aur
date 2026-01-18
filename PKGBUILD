# Maintainer: Diaz <muhammaddiaznurfarizki@gmail.com>
pkgname=m3wal
pkgver=1.1.4 
pkgrel=1
pkgdesc="Material 3 Color Scheme Generator from Wallpaper"
arch=('any')
url="https://github.com/MDiaznf23/m3wal"
license=('GPL-2.0')  
depends=('python' 'python-pillow' 'python-numpy' 'feh')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b1be4f1083e7222d59eb1915940e275f55df1cc61f77d5170901d70f2b30431e')  

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install pip dependency
    PIP_CONFIG_FILE=/dev/null pip install --isolated \
        --root="$pkgdir" --ignore-installed --no-deps \
        --no-compile \
        --root-user-action=ignore \
        material-color-utilities
}
