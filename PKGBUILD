# Maintainer: Jason Edson <jaysonedson@gmail.com>

_pkgname=meld
pkgname=$_pkgname-git
pkgver=3.21.0.125.ga96e5cc0
pkgrel=1
_realver=3.21.0
pkgdesc='Visual diff and merge tool'
arch=('any')
url='http://meldmerge.org/'
license=('GPL')
depends=('dconf'
         'glib2'
         'gsettings-desktop-schemas'
         'gtk3'
         'gtksourceview4'
         'python-cairo'
         'python-gobject')
makedepends=('git'
             'intltool'
             'meson'
             'yelp-tools')
optdepends=('python-dbus: open a new tab in an already running instance')
provides=('meld')
conflicts=('meld' 'meld-dev')
options=('!emptydirs')
source=("git+https://gitlab.gnome.org/GNOME/meld.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --always | sed 's|-|.|g'
}

prepare() {
    cd "$srcdir/$_pkgname"
}

build() {
    cd "$srcdir/$_pkgname"
    arch-meson build -D byte-compile=false
    ninja -C build
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="${pkgdir}" meson install -C build
}
