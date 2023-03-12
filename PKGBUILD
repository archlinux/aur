# Maintainer: Salamandar <felix@piedallu.me>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: kozec <kozec at kozec dot com>

_pkgname=syncthing-gtk
pkgname=$_pkgname-git
pkgver=0.9.4.5.r2.g4064562
pkgrel=1
pkgdesc='GTK3 based GUI and notification area icon for Syncthing. Git version.'
arch=('any')
url='https://github.com/syncthing-gtk/syncthing-gtk'
license=('GPL2')
conflicts=( 'syncthing-gtk' )
depends=(
    'syncthing>=0.14.50' 'gtk3' 'libnotify'
    'python-bcrypt' 'python-cairo' 'python-dateutil' 'python-gobject'
)
makedepends=('python-setuptools' 'git')
source=( "git+$url#branch=meson" )
sha256sums=( 'SKIP' )

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    meson setup "$srcdir/build" "$srcdir/$_pkgname" \
        --prefix=/usr
    ninja -C "$srcdir/build"
}

package() {
    DESTDIR="$pkgdir" \
    ninja -C "$srcdir/build" install
}
