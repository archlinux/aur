# Maintainer: Vincent <ippytraxx@installgentoo.com>

pkgname=gnome-twitch
pkgver=0.1.0
pkgrel=1
pkgdesc="Enjoy Twitch on your GNU/Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/Ippytraxx/gnome-twitch"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gtk3' 'libsoup' 'json-glib' 'gstreamer' 'gst-libav' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'clutter-gst' 'clutter-gtk')
conflicts=('gnome-twitch-git')
install=gnome-twitch.install
source=("https://github.com/Ippytraxx/gnome-twitch/archive/v${pkgver}.tar.gz")
md5sums=('1047adaf29d2c948b68162d129a19fed')

build()
{
    ls
    cd "${pkgname}-${pkgver}"
    mkdir build
    meson . build
    cd build
    ninja
}

package()
{
    cd "${pkgname}-${pkgver}"
    cd build
    mesonconf -Dprefix=/usr 
    mesonconf -Dtype=release
    DESTDIR="$pkgdir" ninja install
}
