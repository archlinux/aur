# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=gpu-viewer
_pkgname=GPU-Viewer
pkgver=3.00
pkgrel=1
pkgdesc="A frontend to glxinfo and vulkaninfo."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/arunsivaramanneo/GPU-Viewer/"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python' 'python-gobject' 'python-click' 'vulkan-tools' 'clinfo' 'mesa-utils' 'vdpauinfo' 'xorg-xdpyinfo' 'lsb-release')
makedepends=('meson' 'ninja')
checkdepends=('appstream-glib')
optdepends=('nvidia: Vulkan nvidia driver'
            'mesa'
            'orchis-theme: Preferred GTK theme'
            'vulkan-radeon: Vulkan AMD drivers'
            'vulkan-intel: Vulkan Intel drivers')
source=("https://github.com/arunsivaramanneo/$_pkgname/archive/v$pkgver.tar.gz")

build() {
    cd "$_pkgname-$pkgver"
    meson setup -D prefix=/usr _build
}

check() {
    cd GPU-Viewer-$pkgver
    appstream-util validate-relax --nonet data/*.metainfo.xml
    desktop-file-validate data/*.desktop
}

package() {
    cd "$_pkgname-$pkgver/_build"
    DESTDIR="$pkgdir" ninja install
}

md5sums=('36c7d7542a9d91937ce7733933217b91')
