# Maintainer: Peter at PBlackman plus com

pkgbase=cdreaper
pkgname=grimripper
_pkgname=GrimRipper
pkgver=3.0.2
pkgrel=1
pkgdesc="CD ripper and encoder using Gtk3 (based on Asunder)"
arch=('x86_64')
url="https://gitlab.gnome.org/Salamandar/${_pkgname}"
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

source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.bz2")
sha256sums=('7d016a90f7800557ac0513d64c6135db498f18efafe3dc4d40cfc6e37a6c8bb1')

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
