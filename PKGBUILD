# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=pypeek-git
pkgver=r1540.4e0fce8
pkgrel=1
pkgdesc="Simple animated GIF screen recorder with an easy to use interface"
arch=(any)
url="https://github.com/firatkiral/pypeek"
license=('GPL3')
depends=('python' 'python-requests' 'pyside6')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
