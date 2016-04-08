# Maintainer: Vincent <ippytraxx@installgentoo.com>

pkgname=gnome-twitch
pkgver=0.2.0
pkgrel=1
pkgdesc="Enjoy Twitch on your GNU/Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/Ippytraxx/gnome-twitch"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gtk3' 'libsoup' 'json-glib' 'gstreamer' 'gst-libav' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'clutter-gst' 'clutter-gtk' 'webkit2gtk')
conflicts=('gnome-twitch-git')
install=gnome-twitch.install
source=("https://github.com/Ippytraxx/gnome-twitch/archive/v${pkgver}.tar.gz")
md5sums=('b6f9ab3dab93ac5f7eb2c8722c7e97f7')

build()
{
    cd "${pkgname}-${pkgver}"
    rm -rf build
    mkdir build
    cd build
    meson.py --prefix /usr --buildtype release -Ddo-post-install=false ..
    ninja
}

package()
{
    cd "${pkgname}-${pkgver}"/build
    DESTDIR="$pkgdir" ninja install
}
