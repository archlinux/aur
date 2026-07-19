# Maintainer: vani-tty1 <giovannirafanan609@gmail.com>
pkgname=memerist-git
pkgver=0.11.0.r0.gefe69d5
pkgrel=1
pkgdesc="A modern meme editor built with GTK 4 and Libadwaita (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/vani-tty1/memerist"
license=('GPL-3.0-or-later')
provides=('memerist')
conflicts=('memerist')
depends=(
  'glib2'
  'gtk4'
  'imagemagick'
  'libadwaita'
  'libepoxy'
  'libjpeg-turbo'
  'libpng'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
  'ninja'
)
source=("${pkgname%-git}::git+${url}.git#branch=unstable")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  arch-meson build
  meson compile -C build
}

check() {
  cd "${pkgname%-git}"
  meson test -C build --print-errorlogs
}


package() {
  cd "${pkgname%-git}"
  meson install -C build --destdir="${pkgdir}"
}
