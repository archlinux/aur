# Maintainer: Tobias Langendorf <junglerobba@jngl.one>
# Contributor: KafCoppelia <k740677208@gmail.com>

pkgname=wlrobs
pkgver=1.2
pkgrel=3
pkgdesc="An obs-studio plugin that allows you to screen capture on wlroots based wayland compositors"
arch=('i686' 'x86_64')
url="https://hg.sr.ht/~scoopta/${pkgname}"
license=('GPL-3.0-only')
depends=('obs-studio')
provides=('wlrobs')
conflicts=('wlrobs-hg')
makedepends=('wayland' 'mercurial' 'meson' 'ninja' 'wlroots0.18')
source=("${pkgname}-v${pkgver}.tar.gz::https://hg.sr.ht/~scoopta/wlrobs/archive/v${pkgver}.tar.gz")
sha256sums=('04b7796da8f9eb5a24fa5a23e0e87f18c6ea69632104949fbd78f0fbe693c0f6')

build() {
    cd ${pkgname}-v${pkgver}
    export CFLAGS="-Wno-error"
    meson setup build -Dwerror=false
    ninja -C build
}

package() {
    cd ${pkgname}-v${pkgver}
    mkdir -p ${pkgdir}/usr/lib/obs-plugins
    install -D -m 0644 build/libwlrobs.so ${pkgdir}/usr/lib/obs-plugins/wlrobs.so
}
