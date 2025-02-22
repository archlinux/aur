# Maintainer: cirlo <cirlo_ca at łøđ dot com>
# Contributor: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: demian <mikar Î±Ï„ gmx Î´Î¿Ï„ de>
pkgname=blockify-git
_name=blockify
pkgver=4.0.0.r0.gbddb5d0
pkgrel=1
pkgdesc="Mutes Spotify advertisements."
arch=("any")
url="https://github.com/carlocastoldi/blockify"
license=("MIT")
depends=("spotify" "alsa-utils" "python-gobject" "dbus-python" "python-docopt")
makedepends=("python-build" "python-installer" "python-wheel")
optdepends=("libpulse: allows muting Spotify instead of all system sound")
conflicts=("blockify")
provides=("blockify")
source=("${pkgname}::git+https://github.com/carlocastoldi/blockify")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/[_-]/./g;s/^v//'
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "${srcdir}/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
