# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_projectname=Fluida.lv2
_plugin_uri="https://github.com/brummer10/$_projectname"
pkgname=${_projectname,,}
pkgver=0.8
pkgrel=2
pkgdesc='An LV2 plugin which wraps the fluidsynth SF2 soundfont player'
arch=(x86_64 aarch64)
url="https://github.com/brummer10/$_projectname"
license=(GPL2)
depends=(cairo)
makedepends=(fluidsynth lv2 xxd)
checkdepends=(lv2lint)
optdepends=('lv2-host: for LV2 plugin')
groups=(lv2-plugins pro-audio)
source=("https://github.com/brummer10/Fluida.lv2/releases/download/v$pkgver/${_projectname%*.lv2}_$pkgver.tar.gz")
sha256sums=('67aa666bf68c13b3def8b47d19589a86ccd8f534aa2090d1304c6c025fe38e51')

build() {
  cd ${_projectname%*.lv2}_$pkgver
  make
}

check() {
  cd ${_projectname%*.lv2}_$pkgver
  lv2lint -Mpack -I Fluida/$_projectname "$_plugin_uri"
}

package() {
  depends+=('libfluidsynth.so')
  cd ${_projectname%*.lv2}_$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
