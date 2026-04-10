# Maintainer: Kevin Rao <kevin.rao@abingdon.org.uk>
pkgname=python-c6-mc6-git
pkgver=r1.ea7980d
pkgrel=1
pkgdesc="MC6 — Mercury V1 altimeter flight configuration tool for FC6"
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
    'python-setuptools-scm'
    'python-wheel'
)
provides=('python-c6-mc6')
conflicts=('python-c6-mc6' 'python-c6-mercuryconfig' 'python-c6-mercuryconfig-git')
replaces=('python-c6-mercuryconfig-git')
source=("${pkgname}::git+https://github.com/kevin-rao1/FC6-Ground-Tools.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname/mc6"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname/mc6"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
