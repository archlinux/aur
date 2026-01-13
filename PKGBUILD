# Maintainer: Diaz <muhammaddiaznurfarizki@gmail.com>
pkgname=m3wal
pkgver=1.1.2 
pkgrel=1
pkgdesc="Material 3 Color Scheme Generator from Wallpaper"
arch=('any')
url="https://github.com/MDiaznf23/m3wal"
license=('GPL-2.0')  
depends=('python' 'python-pillow' 'python-numpy' 'feh')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4837e5e6fd4af049df77c4de4f50514e1fd99d78c1a7e2981956555c3f6d87d3')  

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
