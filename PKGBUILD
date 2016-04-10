# Maintainer: Vincent <ippytraxx@installgentoo.com>

pkgname=gnome-twitch
pkgver=0.2.0
pkgrel=2
pkgdesc="Enjoy Twitch on your GNU/Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/Ippytraxx/gnome-twitch"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gtk3' 'libsoup' 'json-glib' 'gstreamer' 'gst-libav' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'clutter-gst' 'clutter-gtk' 'webkit2gtk')
conflicts=('gnome-twitch-git')
install=gnome-twitch.install
source=("https://github.com/Ippytraxx/gnome-twitch/archive/v${pkgver}.tar.gz"
        "0001-Update-css-to-gtk-3.20.patch")
md5sums=('984b6120aec2f4d121cce3ccb50e367a'
         'b6bbdb0cd4083336f37ce54fd6606581')

prepare()
{
    cd "${pkgname}-${pkgver}"
    patch -p1 < ../0001-Update-css-to-gtk-3.20.patch
}

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
