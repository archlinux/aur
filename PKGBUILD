# Maintainer: Vincent <vinszent@vinszent.com>

pkgname=gnome-twitch
pkgver=0.3.0
pkgrel=1
pkgdesc="Enjoy Twitch on your GNU/Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/vinszent/gnome-twitch"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gtk3' 'libsoup' 'json-glib' 'gstreamer' 'gst-libav' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'webkit2gtk')
conflicts=('gnome-twitch-git')
install=gnome-twitch.install
source=("https://github.com/vinszent/gnome-twitch/archive/v${pkgver}.tar.gz")
md5sums=('7ef9cc4cc81be61a59cbc5d6c006b638')

prepare()
{
    cd "${pkgname}-${pkgver}"
}

build()
{
    cd "${pkgname}-${pkgver}"
    rm -rf build
    mkdir build
    cd build
    meson --prefix /usr --libdir lib --buildtype release -Ddo-post-install=false -Dwith-player-gstreamer-cairo=true -Db_lundef=false ..
    ninja
}

package()
{
    cd "${pkgname}-${pkgver}"/build
    DESTDIR="$pkgdir" ninja install
}
