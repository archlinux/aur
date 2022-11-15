# Maintainer: Salamandar <felix@piedallu.me>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: kozec <kozec at kozec dot com>

pkgname=syncthing-gtk
pkgver=0.9.4.4.2
pkgrel=1
pkgdesc='GTK3 based GUI and notification area icon for Syncthing.'
arch=('any')
url='https://github.com/syncthing-gtk/syncthing-gtk'
license=('GPL2')
replaces=( 'syncthing-gtk-python3' )
depends=(
    'syncthing>=0.14.50' 'gtk3' 'libnotify'
    'python-bcrypt' 'python-cairo' 'python-dateutil' 'python-gobject'
)
makedepends=('python-setuptools' 'git')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
    kde-statusicon.patch
)
sha256sums=(
    '24d34699acd58af0933f51476fe3af655238788be52c4f1c96c6d0ebb1706703'
    '109d8c970045e60251fc64865f05322b23a0995ee6725be02905941cb3a1ae0d'
)

prepare() {
    cd "$pkgname-$pkgver"
    # Enable Gtk.StatusIcon in KDE
    patch -Np1 -i ../kde-statusicon.patch
}

build() {
    cd "$pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
