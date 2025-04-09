# Maintainer: oldkingOK <oldkingok.creeper@gmail.com>
pkgname=pyinstxtractor-ng-git
_pkgname="${pkgname%-git}"
pkgver=r28.b733293
pkgrel=1
pkgdesc="PyInstaller Extractor Next Generation"
arch=('any')
license=('GPL-3.0-only')
makedepends=('uv')
_main_py="pyinstxtractor_ng.py"
_main="${_pkgname}"
url="https://github.com/pyinstxtractor/${_pkgname}"
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    uv sync
    source .venv/bin/activate
    uv pip install pyinstaller
    pyinstaller -F pyinstxtractor_ng.py --name pyinstxtractor-ng

    install -Dm755 "${srcdir}/${_pkgname}/dist/${_main}" "${pkgdir}/usr/bin/${_main}"
}
