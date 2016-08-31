# Maintainer: Vincent <vinszent@vinszent.com>

_pkgname=gnome-twitch
pkgname=gnome-twitch-mpv
pkgver=0.3.0
pkgrel=1
pkgdesc="MPV player backend plugin for GNOME Twitch"
arch=('i686' 'x86_64')
url="https://github.com/vinszent/gnome-twitch"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gnome-twitch' 'gtk3' 'libpeas' 'gobject-introspection' 'mpv')
source=("https://github.com/vinszent/gnome-twitch/archive/v${pkgver}.tar.gz")
md5sums=('7ef9cc4cc81be61a59cbc5d6c006b638')

prepare()
{
    cd "${_pkgname}-${pkgver}"
}

build()
{
    cd "${_pkgname}-${pkgver}"/subprojects/player-backend-mpv-opengl
    rm -rf build
    mkdir build
    cd build
    meson --prefix /usr --libdir lib --buildtype release ..
    ninja
}

package()
{
    cd "${_pkgname}-${pkgver}"/subprojects/player-backend-mpv-opengl/build
    DESTDIR="$pkgdir" ninja install
}
