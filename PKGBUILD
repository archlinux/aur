# Maintainer: Hossam Mostafa <hossamdash2@gmail.com>

_pkgname=cute-sway-recorder
pkgname=cute-sway-recorder-git
pkgver=r69.8a098f4
pkgrel=1
pkgdesc="A small graphical screen recorder for wl-roots, leveraging wf-recorder and slurp"
arch=('any')
url="https://github.com/it-is-wednesday/cute-sway-recorder"
license=('GPL3')
depends=('python' 'pyside6' 'wf-recorder' 'slurp')
makedepends=('git' 'python-poetry')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")
source=("git+https://github.com/it-is-wednesday/cute-sway-recorder.git" "cute-sway-recorder.desktop")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/${_pkgname}"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/cute-sway-recorder.desktop" "$pkgdir/usr/share/applications/cute-sway-recorder.desktop"
}
