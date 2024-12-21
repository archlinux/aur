# Maintainer: Tobias Langendorf <junglerobba@jngl.one>
# Contributor: klardotsh <josh@klar.sh>
# Contributor: KafCoppelia <k740677208@gmail.com>

_pkgname=wlrobs
pkgname=${_pkgname}-hg
pkgver=r72.958a52be0f0f
pkgrel=3
pkgdesc="An obs-studio plugin that allows you to screen capture on wlroots based wayland compositors"
arch=('i686' 'x86_64')
provides=('wlrobs')
conflicts=(wlrobs)
url="https://hg.sr.ht/~scoopta/wlrobs"
license=('GPL-3.0-only')
depends=('obs-studio' 'wlroots')
makedepends=('wayland' 'mercurial' 'meson' 'ninja')
source=("hg+https://hg.sr.ht/~scoopta/${_pkgname}")
md5sums=('SKIP')
_hgrepo="hg"

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd ${_pkgname}
    export CFLAGS="-Wno-error"
    meson setup build -Dwerror=false
    ninja -C build
}

package() {
    cd ${_pkgname}
    mkdir -p ${pkgdir}/usr/lib/obs-plugins
    install -D -m 0644 build/libwlrobs.so ${pkgdir}/usr/lib/obs-plugins/wlrobs.so
}
