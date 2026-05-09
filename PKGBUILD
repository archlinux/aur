# Maintainer: Your Name <your.email@example.com>

pkgname=stcli
pkgver=1.0.0
pkgrel=1
pkgdesc="A beautiful CLI for Syncthing"
arch=('any')
url="https://github.com/anshumansingh0010/syncthing-cli" # Update with your repository URL
license=('MIT') # Update with the correct license if not MIT
depends=(
    'python'
    'python-click'
    'python-requests'
    'python-rich'
    'python-urllib3'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)

# For publishing to AUR, you typically build from a release tarball
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f088557df104454ff555cebb1c92b6a62e4a127a5bab55cc976fcfe60fbd9971')

build() {
    # If the extracted directory has a different name, update this path
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Optional: Install a license file if you have one
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
