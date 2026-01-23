# Maintainer: Diaz <muhammaddiaznurfarizki@gmail.com>
pkgname=m3wal
pkgver=1.1.9 
pkgrel=1
pkgdesc="Material 3 Color Scheme Generator from Wallpaper"
arch=('any')
url="https://github.com/MDiaznf23/m3wal"
license=('GPL-2.0')  
depends=('python' 'python-pillow' 'python-numpy' 'feh')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('437e3513a49ffa71c8401077ed16da936a7436ecafc79f2bc7c753aeebdb2308')  

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
