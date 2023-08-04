# Maintainer:  Campbell Jones <arch at serebit dot com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=magpie-wm
_pkgname=magpie
pkgver=0.9.2
pkgrel=1
pkgdesc="Budgie's X11 window manager and compositor library forked from Mutter"
url="https://github.com/BuddiesOfBudgie/magpie"
arch=(x86_64)
license=(GPL)
depends=(colord dconf gnome-desktop gnome-settings-daemon graphene gsettings-desktop-schemas
         lcms2 libcanberra libgudev libinput libsm libxkbcommon-x11 libxkbfile mutter pipewire 
         startup-notification)
makedepends=(gobject-introspection meson sysprof xorg-server)
source=("https://github.com/BuddiesOfBudgie/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.tar.xz"{,.asc})
b2sums=('0ca3e2a001ce8f577e47583f31698b583016a9061cedafacac75631dca5c0f627b7d027dc18ab197b98f3690dc9c7f9a972df0f6d34185df1c405c68fc187a85'
        'SKIP')

build() {
    CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
    LDFLAGS+=" -Wl,-Bsymbolic-functions"

    arch-meson "${_pkgname}-$pkgver" build -Degl_device=true
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
