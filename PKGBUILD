# Maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: gj545rndmu <6zogm6z2nh at bljvf anonbox net>
# Contributor: Pranav Jerry <libreinator@disroot.org>
# Contributor:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: maus25 <mirko378@gmail.com>

pkgname=gnome-shell-pomodoro
pkgver=1.0
pkgrel=1
pkgdesc='A time management utility for GNOME based on the pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/gnome-pomodoro/gnome-pomodoro'
license=('GPL3')
depends=('gobject-introspection' 'glib2' 'gom' 'gtk3' 'cairo' 'glibc' 'libpeas' 'sqlite' 'gstreamer' 'libcanberra' 'libpeas-2')
makedepends=('meson' 'vala')
source=("$pkgname-$pkgver.tar.gz::https://github.com/focustimerhq/FocusTimer/archive/refs/tags/$pkgver.tar.gz"
        "fix-vala-0.56.19.patch")
sha256sums=('1d8d6adcb83d74ae5c05a9caa988bf5dd0c2876af83d3df3588d27f2ee5cf9ab'
            '6cc8938546654e4ca37e7501d97e3d9fc485589e2c7895eeb3b1cc63a386e8cc')

prepare() {
    cd "$srcdir/FocusTimer-$pkgver"
    patch -Np1 -i "$srcdir/fix-vala-0.56.19.patch"
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
