# Maintainer:
# Contributor: Faule Socke <github@socker.lepus.uberspace.de>

pkgname=python-pyassimp-git
pkgver=6.0.4.r26.gfcb170216
pkgrel=1
pkgdesc="Python bindings for the Open Asset Import Library (ASSIMP)"
arch=(any)
url="https://www.assimp.org/"
license=('ISC')
depends=('python' 'assimp')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
    'python-numpy: used internally for data arrays'
    'python-opengl: to run examples'
    'python-pygame: to run examples'
)
conflicts=(${pkgname-%git})
provides=(${pkgname-%git})
source=('git+https://github.com/assimp/assimp.git')
sha256sums=('SKIP')

pkgver() {
    cd assimp
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    cd assimp/port/PyAssimp
    python -m build --wheel --no-isolation
}

package() {
    cd assimp/port/PyAssimp
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
