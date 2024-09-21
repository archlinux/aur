# Maintainer: a821

pkgname=txt2tags-git
pkgver=3.9.r0.gbc7f2c4
pkgrel=2
pkgdesc="A text formatting and conversion tool"
arch=('any')
url="https://txt2tags.org/"
license=('GPL-2.0-or-later')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/txt2tags/txt2tags.git#branch=v3")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --tags --long | sed 's/-/.r/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=4 sw=4 et:
