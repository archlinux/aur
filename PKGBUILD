# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gr-framework-git"
pkgver="1.24.0.r1.gf099201"
pkgrel="2"
pkgdesc="A universal framework for cross-platform visualization applications (Python bindings)."
arch=("any")
url="https://gr-framework.org"
license=("MIT")
depends=("gr-framework" "python" "python-numpy")
makedepends=("git" "python-build" "python-installer" "python-setuptools" "python-vcversioner" "python-wheel")
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/sciapp/python-gr.git#branch=develop")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${pkgname%-*}" || return
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-*}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname%-*}" || return
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
