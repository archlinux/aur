# Maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: gj545rndmu <6zogm6z2nh at bljvf anonbox net>
# Contributor: Pranav Jerry <libreinator@disroot.org>
# Contributor:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: maus25 <mirko378@gmail.com>

pkgname=gnome-shell-pomodoro
pkgver=1.1.0
pkgrel=1
pkgdesc='A time management utility for GNOME based on the pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/gnome-pomodoro/gnome-pomodoro'
license=('GPL3')
depends=('gobject-introspection' 'glib2' 'gom' 'gtk4' 'libadwaita' 'cairo' 'glibc' 'sqlite' 'gstreamer' 'libpeas-2' 'pango' 'graphene' 'json-glib')
makedepends=('meson' 'vala')
source=("$pkgname-$pkgver.tar.gz::https://github.com/focustimerhq/FocusTimer/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('844a04039fedad6e6d8c4920f6c414fd31e70486b8792cd641c479896a59c97e')

prepare() {
    cd "$srcdir/FocusTimer-$pkgver"
    # patch -Np1 -i "$srcdir/fix-vala-0.56.19.patch"
}

build() {
    cd "$srcdir/FocusTimer-$pkgver"
    arch-meson build
    meson compile -C build
}

package() {
    cd "$srcdir/FocusTimer-$pkgver"
    meson install -C build --destdir "$pkgdir"
}
