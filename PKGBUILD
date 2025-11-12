# Maintainer: Torben <git at letorbi dot com>
# Contributor: fisch02

pkgname=gnome-calendar-git
pkgver=49.0.r44.gf68d83ae
pkgrel=1
arch=(x86_64)
pkgdesc="Simple and beautiful calendar application designed to perfectly fit the GNOME desktop"
url="https://apps.gnome.org/Calendar"
license=(GPL-3.0-or-later)
depends=(
    dconf
    evolution-data-server
    gcc-libs
    geoclue
    glib2
    glibc
    graphene
    #gsettings-desktop-schemas # namcap: maybe not needed
    gtk4
    hicolor-icon-theme
    libadwaita
    libedataserverui4
    libgweather-4
    libical
    libsoup3
    #pango # namcap: maybe not needed
)
makedepends=(
    blueprint-compiler
    git
    glib2-devel
    meson
)
optdepends=(
    'gnome-control-center: Manage online accounts'
    'xdg-desktop-portal-impl: Various user settings (e.g. 24-hour clock)'
)
provides=('gnome-calendar')
conflicts=('gnome-calendar')
source=("git+https://gitlab.gnome.org/GNOME/gnome-calendar.git")
b2sums=('SKIP')

prepare() {
    ln -s "$srcdir/gnome-calendar" "$srcdir/$pkgname"
}

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/^gnome-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson $pkgname build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
