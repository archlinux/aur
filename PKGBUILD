_name=scheduler
pkgname=python-$_name-git
pkgver=0.0.1.rc1.r12.gd211d2c
pkgrel=2
pkgdesc="Uses data from taskwarrior and timewarrior to indicate which task should be done next"
arch=('any')
url="https://github.com/ftapajos/scheduler"
license=('GPL-3.0-or-later')
depends=('python-tasklib' 'python-typer' 'timew')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
    cd $_name
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

