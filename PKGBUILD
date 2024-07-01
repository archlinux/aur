# Maintainer:  Campbell Jones <arch at serebit dot com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=magpie-wm
_pkgname=magpie
pkgver=0.9.3
pkgrel=2
pkgdesc="Budgie's X11 window manager and compositor library forked from Mutter"
url="https://github.com/BuddiesOfBudgie/magpie"
arch=(x86_64)
license=(GPL)
depends=(colord dconf glib2-devel gnome-desktop gnome-settings-daemon graphene gsettings-desktop-schemas
         lcms2 libcanberra libgudev libinput libsm libxkbcommon-x11 libxkbfile mutter pipewire 
         startup-notification)
makedepends=(gobject-introspection meson sysprof xorg-server)
source=("https://github.com/BuddiesOfBudgie/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.tar.xz"{,.asc})
b2sums=('cb59abda4a2a6375ed9c1762931150e922974c6ed92909035426e33a8585420d9f7e7b32795aae4efd63e85237d2cbb5ce55ee25d1be0263ed14f71070412d87'
        'SKIP')
validpgpkeys=("1E1FB0017C998A8AE2C498A6C2EAA8A26ADC59EE" # David Mohammed <fossfreedom at ubuntu dot com>
              "0E0D97562A4EC8BD8E329DCDAA7A2325E04B609B") # Joshua Strobl <me at joshuastrobl dot com>

build() {
    CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
    LDFLAGS+=" -Wl,-Bsymbolic-functions"

    arch-meson "${_pkgname}-$pkgver" build -Degl_device=true
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
