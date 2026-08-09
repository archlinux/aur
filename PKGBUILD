# Maintainer: kezuwoo <kezu15@proton.me>

pkgname=kitsune
pkgver=1.0.0
pkgrel=1
pkgdesc="AniLiberty player"
arch=('any')
url="https://altlinux.space/armatik/Kitsune"
license=('GPL-3.0-or-later')

depends=(
'python'
'python-gobject'
'python-cairo'
'python-keyring'
'libadwaita'
'gtk4'
'gstreamer'
'gst-plugins-base'
'gst-plugins-good'
'gst-plugins-bad'
'gst-plugin-gtk4'
)

makedepends=('meson' 'ninja' 'git' 'blueprint-compiler')

source=("git+https://altlinux.space/armatik/Kitsune.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Kitsune"
  git describe --tags --abbrev=0 | sed 's/^v//'
}

build() {
  cd "$srcdir/Kitsune"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
    cd "$srcdir/Kitsune"
    DESTDIR="$pkgdir" meson install -C build
}
