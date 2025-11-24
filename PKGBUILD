# Maintainer: Dan Johansen <strit@archlinux.org>

pkgname=gpu-viewer
_pkgname=GPU-Viewer
pkgver=3.22
pkgrel=1
pkgdesc="A frontend to glxinfo and vulkaninfo."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/arunsivaramanneo/$_pkgname/"
license=('GPL-3.0-or-later')
depends=(
        'gtk4'
        'libadwaita'
        'python'
        'python-gobject'
        'python-click'
        'vulkan-tools'
        'clinfo'
        'mesa-utils'
        'vdpauinfo'
        'xorg-xdpyinfo'
        'lsb-release'
)
makedepends=(
            'meson'
            'ninja'
)
checkdepends=('appstream-glib')
optdepends=(
            'nvidia: Vulkan nvidia driver'
            'mesa'
            'orchis-theme: Preferred GTK theme'
            'vulkan-radeon: Vulkan AMD drivers'
            'vulkan-intel: Vulkan Intel drivers'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/arunsivaramanneo/$_pkgname/archive/v$pkgver.tar.gz")

build() {
    cd "$_pkgname-$pkgver"
    meson setup -D prefix=/usr _build
}

check() {
    cd $_pkgname-$pkgver
    appstream-util validate-relax --nonet data/*.metainfo.xml
    desktop-file-validate data/*.desktop
}

package() {
    cd "$_pkgname-$pkgver/_build"
    DESTDIR="$pkgdir" ninja install
}

sha256sums=('34d35a00cbb38de7987d3715180ba549263a01238f918c0ea70e37cbcfadae99')
