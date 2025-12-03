# Maintainer: flouda <tnd@flouda.io>
pkgname=ufw-manager-git
pkgver=r2.1bb671a  # Updated automatically
pkgrel=1
pkgdesc="TUI-based UFW firewall rule manager (git version)"
arch=('any')
url="https://git.flouda.net/flouda/ufw-manager"
license=('MIT')
depends=('python>=3.11' 'python-textual' 'python-rich' 'python-click' 'python-pydantic' 'ufw')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('python-ufw-manager')
conflicts=('python-ufw-manager')
source=("git+https://git.flouda.net/flouda/ufw-manager.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/ufw-manager"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/ufw-manager"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/ufw-manager"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
