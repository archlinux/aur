# Maintainer: Sam Day <me@samcday.com>

pkgname=phog
pkgver=0.1.6
pkgrel=2
pkgdesc="A greetd-compatible greeter for mobile devices like Purism's Librem 5 and Pine64's PinePhone."
url='https://gitlab.com/mobian1/phog'
license=(GPL3)
arch=(aarch64 x86_64)
depends=(
    gnome-shell
    gsettings-desktop-schemas
    phoc
    squeekboard
)
makedepends=(
    gcr
    glib2
    gnome-desktop
    gtk-doc
    gtk3
    json-glib
    libgudev
    libhandy
    libnm
    meson
    pam
    pandoc-cli
    python-packaging
    systemd-libs
    upower
    wayland-protocols

    # to run the tests
    at-spi2-core
    dbus
    gnome-settings-daemon
    gnome-themes-extra
    xorg-server-xvfb
    xorg-xauth

)
_srcname="phog-${pkgver}"
source=("${_srcname}.tar.gz::${url}/-/archive/${pkgver}/${_srcname}.tar.gz")
sha256sums=('e62b2eab7f6056285815edc81de62fb40d9589a1aa68a426b7688bd1c640ce4b')

build() {
    cd "${_srcname}"
    arch-meson build
    ninja -C build
}

package() {
    cd "${_srcname}"
    meson install -C build --destdir "$pkgdir"
}

check() {
    cd "${_srcname}"
    xvfb-run meson test -C build
}
