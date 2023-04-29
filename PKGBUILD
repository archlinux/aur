# Maintainer: Peter at PBlackman plus com

pkgname=cdreaper
_pkgname=Reaper
pkgver=3.0.0
pkgrel=1
pkgdesc="CD ripper and encoder using Gtk3 (based on Asunder)"
arch=('x86_64')
url="https://gitlab.gnome.org/Salamandar/Reaper"
license=('GPL2')
depends=('gtk3' 'glibc' 'glib2' 'libcddb' 'cdparanoia' 'hicolor-icon-theme')
makedepends=('meson' 'gettext')
optdepends=(
  'lame: for mp3 support'
  'vorbis-tools: for ogg support'
  'fdkaac: for mp3 support'
  'flac: for flac support'
  'opus-tools: for opus support'
  'wavpack: for wavpack support'
  'musepack-tools: for musepack support'
  'mac: for monkey audio support'
)

source=("$url/-/archive/v${pkgver}/Reaper-v${pkgver}.tar.bz2")
sha256sums=('973db74d4300ce52e0ebfe4d5ed057cd7523033aa8b85c3f1bce439816b9d1c4')

prepare() {
  cd "${_pkgname}-v${pkgver}"
  rm -fr build
  mkdir build
  meson setup --prefix=/usr build .
}

build() {
  cd "${_pkgname}-v${pkgver}/build"
  ninja
}

package() {
  cd "${_pkgname}-v${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install  
}
