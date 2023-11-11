# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=raddiola
pkgver=1.1.7
pkgrel=1
pkgdesc='Simple radio with a clear and concise interface'
url="https://github.com/alexkdeveloper/raddiola"
arch=('x86_64')
license=('GPL3')
depends=('granite' 'gstreamer' 'libpulse')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s com.github.alexkdeveloper.$pkgname "$pkgdir/usr/bin/$pkgname"
}
