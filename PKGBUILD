# Maintainer: Zack Didcott

pkgname=lyri-git
pkgver=1.2.1
pkgrel=1
pkgdesc="HTTP music dashboard to control playback via playerctl and display lyrics."
arch=("any")
url="https://github.com/Zedeldi/lyri"
license=("MIT")
depends=("python" "python-sanic" "python-requests" "python-syncedlyrics" "python-gobject")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
provides=("lyri")
conflicts=("lyri")
source=("${pkgname}::git+https://github.com/Zedeldi/lyri.git")
b2sums=("SKIP")

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}