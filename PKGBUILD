# Maintainer: Tobias Langendorf <junglerobba@jngl.one>
# Contributor: klardotsh <josh@klar.sh>
# Contributor: KafCoppelia <k740677208@gmail.com>

_pkgname=wlrobs
pkgname=${_pkgname}-hg
pkgver=r75.b8668b4d6d6d
pkgrel=2
pkgdesc="An obs-studio plugin that allows you to screen capture on wlroots based wayland compositors"
arch=('i686' 'x86_64')
provides=('wlrobs')
conflicts=('wlrobs')
url="https://hg.sr.ht/~scoopta/${_pkgname}"
license=('GPL-3.0-only')
depends=('obs-studio')
makedepends=('wayland' 'mercurial' 'meson' 'ninja' 'wlroots0.18')
source=("hg+https://hg.sr.ht/~scoopta/${_pkgname}")
sha256sums=('SKIP')


pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd ${_pkgname}
    meson setup build
    ninja -C build
}

package() {
    cd ${_pkgname}
    mkdir -p ${pkgdir}/usr/lib/obs-plugins
    install -D -m 0644 build/libwlrobs.so ${pkgdir}/usr/lib/obs-plugins/${_pkgname}.so
}
