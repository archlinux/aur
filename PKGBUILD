# Maintainer: Vincent <vinszent@vinszent.com>

pkgname=gnome-twitch
pkgver=0.4.2
pkgrel=1
pkgdesc="Enjoy Twitch on your GNU/Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/vinszent/gnome-twitch"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gtk3' 'libsoup' 'json-glib' 'webkit2gtk' 'libpeas' 'gobject-introspection')
conflicts=('gnome-twitch-git')
source=("https://github.com/vinszent/gnome-twitch/archive/v${pkgver}.tar.gz")
md5sums=('36497a697cb71fecaaa6939575235b16')

build()
{
    cd "${pkgname}-${pkgver}"
    rm -rf build
    mkdir build
    cd build
    meson --prefix=/usr --libdir=lib --buildtype=release ..
    ninja
}

package()
{
    cd "${pkgname}-${pkgver}"/build
    DESTDIR="$pkgdir" ninja install
}

