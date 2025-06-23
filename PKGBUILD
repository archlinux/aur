# Maintainer: Sam Collier <samcollier916@gmail.com>
pkgname=ue4cli-git
pkgver=r147.fed71c1
pkgrel=1
pkgdesc="Command-line interface for Unreal Engine 4"
arch=('any')
url="https://github.com/adamrehn/ue4cli"
license=('MIT')
depends=(
    'python>=3.5'
    'python-setuptools>=38.6.0'
    'python-wheel>=0.31.0'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'python-twine'
)
optdepends=(
    'unreal-engine: for full functionality'
    'conan: for conan-ue4cli integration'
    'docker: for containerized builds'
)
provides=("ue4cli=${pkgver}")
conflicts=('ue4cli')
source=("${pkgname}::git+https://github.com/adamrehn/ue4cli.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
