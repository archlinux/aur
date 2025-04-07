
pkgname=python-timbl-git
pkgver=2025.01.22.r0.g5707c71
pkgrel=1
pkgdesc='Python binding for Timbl, a k-Nearest Neighbours machine learning suite'
arch=('x86_64')
url="https://github.com/proycon/python-timbl"
license=('GPL-3.0-or-later')
depends=('python' 'boost-libs' 'gcc-libs' 'timbl')
makedepends=('boost' 'git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-scipy')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
