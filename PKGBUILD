# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>

pkgname=venus-protocol-git
pkgdesc="Virtio-GPU protocol for Vulkan command serialization"
pkgver=r378.3b74c14
pkgrel=1
arch=('any')
makedepends=(
    git meson ninja python-mako
)
depends=(
)
provides=(venus-protocol)
conflicts=(
    venus-protocol
)
url="https://docs.mesa3d.org/drivers/venus.html"
license=('LicenseRef-unknown')
source=(
    'venus-protocol-git::git+https://gitlab.freedesktop.org/virgl/venus-protocol.git'
)
sha256sums=('SKIP'
)


pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build () {

    meson setup $pkgname _build
    meson configure --no-pager _build
    meson compile -C _build
}

package() {
    meson install -C _build --destdir "$pkgdir"
}
