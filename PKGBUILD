# Maintainer: Ben Copeland <ben@copeland.me.uk>
pkgname=tuxsuite
pkgver=1.42.2  
pkgrel=1
pkgdesc="A command-line client for TuxSuite services"
arch=('any')
url="https://docs.tuxsuite.com/"
license=('Apache')
depends=('python' 'python-pip' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-dkim' 'b4' 'python-voluptuous' 'python-flask' 'python-flask-restful')
makedepends=('python-setuptools' 'python-build')
source=("https://files.pythonhosted.org/packages/source/t/tuxsuite/tuxsuite-$pkgver.tar.gz")
sha256sums=('SKIP')

	build() {
    cd "$srcdir/tuxsuite-$pkgver"

    # Build using pyproject.toml (for projects that lack setup.py)
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/tuxsuite-$pkgver"


    # Run tests using pytest
    pytest
}

package() {
    cd "$srcdir/tuxsuite-$pkgver"

    # Install the package using the built wheel
    python -m installer --destdir="$pkgdir" dist/*.whl
}

