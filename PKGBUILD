# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=recorder
pkgver=1.0.18
_commit=585365d971cfc88c1c910839219c836a27beebc8
pkgrel=1
pkgdesc='Simple audio recorder'
url="https://github.com/alexkdeveloper/recorder"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('gstreamer' 'libadwaita' 'libpulse')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  $name=com.github.alexkdeveloper.$pkgname
  meson install -C build --destdir "$pkgdir"
  ln -s $name "$pkgdir/usr/bin/$pkgname"
  cd $pkgname
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 data/$name.xml.in "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.xml"
}
