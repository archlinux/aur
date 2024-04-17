# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=pavucontrol
pkgname=$_pkgname-git
pkgver=5.0.r73.g44f9848
pkgrel=1
pkgdesc="A GTK volume control for PulseAudio"
arch=("i686" "x86_64")
url="http://freedesktop.org/software/pulseaudio/pavucontrol/"
license=("GPL-2.0-or-later")
depends=('gtkmm-4.0' 'libpulse' 'libcanberra')
optdepends=('pulseaudio: audio output')
makedepends=('git' 'meson' 'libsigc++' 'lynx')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.freedesktop.org/pulseaudio/pavucontrol.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
