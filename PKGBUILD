# Maintainer: Martin Schrodt <martin@schrodt.org>

pkgname=vfio-isolate
pkgver=0.2.2
pkgrel=2
pkgdesc="commandline tool to facilitate CPU core isolation"
arch=('i686' 'x86_64')
url="https://pypi.org/project/vfio-isolate"
license=('MIT')
depends=('python' 'python-click' 'python-psutil' 'python-parsimonious')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('9897c424ac9034e8a03b1ad980853750')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"  
    _VFIO_ISOLATE_COMPLETE=source_zsh python "$pkgdir/usr/lib/python3.8/site-packages/vfio_isolate/cli.py" > "$pkgdir/usr/share/zsh/site-functions/_vfio-isolate" || true
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"  
    _VFIO_ISOLATE_COMPLETE=source_bash python "$pkgdir/usr/lib/python3.8/site-packages/vfio_isolate/cli.py" > "$pkgdir/usr/share/bash-completion/completions/vfio-isolate" || true
}
