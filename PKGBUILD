# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=xontrib-vox-git
pkgver=r12.fe51b7b
pkgrel=1
pkgdesc="Python virtual environment manager for xonsh"
url="https://github.com/xonsh/xontrib-vox"
arch=('any')
license=('MIT')
source=("git+$url")
depends=('xonsh' 'python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')

sha256sums=('SKIP')
provides=("xontrib-vox")

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
