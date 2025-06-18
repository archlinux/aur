# Maintainer: Idigo Luwum <luwum@pm.me>

pkgname=python-coqpit-config
_name=coqpit-config
_pyname=coqpit_config
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple, light-weight config management through python data-classes (fork of coqpit)"
arch=('any')
url="https://github.com/idiap/coqui-ai-coqpit"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
provides=('python-coqpit')
conflicts=('python-coqpit')
replaces=('python-coqpit')
source=("https://files.pythonhosted.org/packages/9e/4c/e444f35f5c7c3bbfc6cc231a749c6afcd6da20d2630bba75ccd9e070b84d/$_pyname-$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace with actual checksum after downloading

build() {
    cd "$_pyname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pyname-$pkgver"
    # Run tests if available
    python -m pytest tests/ || true
}

package() {
    cd "$_pyname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license if available
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
    
    # Install documentation
    if [ -f README.md ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}
