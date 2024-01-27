# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=python-ite8291r3-ctl-git
_pkgname=${pkgname%-git}
pkgver=r22.d2c490a
pkgrel=4
pkgdesc="ITE 8291 (rev 0.03) userspace driver"
arch=('any')
url="https://github.com/pobrn/ite8291r3-ctl"
license=('GPL-2.0-only')
depends=(
    'python>=3.6'
    'python-pyusb'
)
makedepends=(
    'git'
    'python-setuptools'
    'python-build'
    'python-installer'
    'python-wheel'
)
optdepends=(
    'python-xlib: Experimental screen mode support (Xorg only)'
    'python-pillow: Experimental screen mode support (Xorg only)'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
