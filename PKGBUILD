# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: demian <mikar Î±Ï„ gmx Î´Î¿Ï„ de>

pkgname=blockify-git
pkgver=v3.6.3.r24.g370d321
pkgrel=2
pkgdesc="Mutes Spotify advertisements."
arch=("any")
url="https://github.com/carlocastoldi/blockify"
license=("MIT")
depends=("spotify" "pulseaudio" "alsa-utils" "wmctrl" "libwnck3" "pygtk"
         "gst-python" "python-dbus" "python-setuptools" "python-docopt")
makedepends=("python-build" "python-installer" "python-wheel")
conflicts=("blockify")
provides=("blockify")
source=("${pkgname}::git+https://github.com/carlocastoldi/blockify#branch=pipewire")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/[_-]/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 "${srcdir}/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
