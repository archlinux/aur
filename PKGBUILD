# Maintainer: Kevin Rao <kevin.rao@abingdon.org.uk>
pkgname=python-c6-mercuryconfig-git
pkgver=r1.ea7980d
pkgrel=1
pkgdesc="Mercury V1 altimeter flight configuration tool for FC6"
arch=('any')
url="https://github.com/kevin-rao1/FC6-Ground-Tools"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-pyserial'
    'python-requests'
    'networkmanager'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
provides=('python-c6-mercuryconfig')
conflicts=('python-c6-mercuryconfig')
source=("${pkgname}::git+https://github.com/kevin-rao1/FC6-Ground-Tools.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname/mercury-config"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname/mercury-config"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
