# Maintainer: Arthur de Araújo Farias <arthur@afarias.org>
pkgname=qemu-cli-git
_pkgname=qemu-cli
pkgver=0.1.0.r5.g61f0d2b
pkgrel=1
pkgdesc="Docker-style CLI for managing QEMU VM command lines"
arch=('any')
url="https://github.com/arthurafarias/qemu-cli"
license=('MIT')
depends=('python' 'python-click')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov')
optdepends=('qemu-base: run QEMU virtual machines'
            'qemu-full: full QEMU emulator suite with GUI')
provides=('qemu-cli')
conflicts=('qemu-cli')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname"
    PYTHONPATH="lib" python -m pytest
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
