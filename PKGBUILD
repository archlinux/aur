# Maintainer: Vincent <vinszent@vinszent.com>

pkgname=gnome-twitch
pkgver=0.3.1
pkgrel=1
pkgdesc="Enjoy Twitch on your GNU/Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/vinszent/gnome-twitch"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gtk3' 'libsoup' 'json-glib' 'gstreamer' 'gst-libav' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'webkit2gtk' 'libpeas' 'gobject-introspection')
conflicts=('gnome-twitch-git')
source=("https://github.com/Ippytraxx/gnome-twitch/archive/v${pkgver}.tar.gz")
md5sums=('cd25985e4f6f5eb24978f85cd92f3a27')

build()
{
    cd "${pkgname}-${pkgver}"
    rm -rf build
    mkdir build
    cd build
    meson --prefix=/usr --libdir=lib --buildtype=release -Ddo-post-install=false -Dwith-player-gstreamer-cairo=true -Db_lundef=false ..
    ninja
}

package()
{
    cd "${pkgname}-${pkgver}"/build
    DESTDIR="$pkgdir" ninja install
}
