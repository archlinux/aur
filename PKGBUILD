# Maintainer: Vincent <vinszent@vinszent.com>

pkgname=gnome-twitch
pkgver=0.4.1
pkgrel=2
pkgdesc="Enjoy Twitch on your GNU/Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/vinszent/gnome-twitch"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gtk3' 'libsoup' 'json-glib' 'webkit2gtk' 'libpeas' 'gobject-introspection')
conflicts=('gnome-twitch-git')
source=("https://github.com/vinszent/gnome-twitch/archive/v${pkgver}.tar.gz"
        "0001-Fix-typo-in-Meson-build-options.patch")
md5sums=('452609cf714ef98153c64949ba7ba130'
         '9efc76e74fbfd6ca20a2b474b0980002')

prepare()
{
  cd "${pkgname}-${pkgver}"
  patch -p1 -i ../0001-Fix-typo-in-Meson-build-options.patch
}

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
