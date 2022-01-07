pkgname=nvidia-vaapi-driver-git
_pkgname=nvidia-vaapi-driver
pkgver=0.0.1.r16.gfe068ca
pkgrel=1
pkgdesc="A VA-API implemention using NVIDIA's NVDEC"
arch=('x86_64')
url="https://github.com/elFarto/nvidia-vaapi-driver"
license=('MIT')
depends=('nvidia-utils' 'gst-plugins-bad-libs')
makedepends=('meson' 'cuda' 'git' 'gst-plugins-bad')
provides=('nvidia-vaapi-driver')
conflicts=('nvidia-vaapi-driver')
source=("${_pkgname}::git+$url.git")
sha1sums=('SKIP')


pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "$_pkgname"
    #sed -i "s|usr/include/cuda|opt/cuda/include|" meson.build
    #sed -i "s|drm/drm|libdrm/drm|" src/vabackend.c
    arch-meson . build
}

build() {
    cd "$_pkgname"
    ninja -C build
}

package() {
    cd "$_pkgname"
    DESTDIR="${pkgdir}" ninja -C build install
}
