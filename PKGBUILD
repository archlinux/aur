# Maintainer: Nyx <nnyyxxxx@protonmail.com>
# https://github.com/nnyyxxxx/PKGBUILDs

pkgname=pywalfox-librewolf-git
pkgver=r103.9b7bc53
pkgrel=2
pkgdesc="pywalfox daemon with librewolf support added"
arch=('x86_64')
url="https://github.com/nnyyxxxx/pywalfox-native"
license=('MIT')
depends=('python')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
)

source=("${pkgname}::git+https://github.com/nnyyxxxx/pywalfox-native.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
