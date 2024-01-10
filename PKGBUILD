# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Fluida.lv2
_plugin_uri="https://github.com/brummer10/$_name"
pkgname=${_name,,}
pkgver=0.9.1
pkgrel=1
pkgdesc='An LV2 plugin which wraps the fluidsynth SF2 soundfont player'
arch=(x86_64 aarch64)
url="https://github.com/brummer10/$_name"
license=(GPL2 MIT)
depends=(cairo gcc-libs glibc libx11)
makedepends=(fluidsynth lv2 xxd)
checkdepends=(lv2lint)
optdepends=('lv2-host: for loading the LV2 format plugin')
groups=(lv2-plugins pro-audio)
source=("https://github.com/brummer10/Fluida.lv2/releases/download/v$pkgver/${_name}-v$pkgver-src.tar.xz")
sha256sums=('d9aaa6802fb2ff37c6227c8f090a20a2cf5bf900798ef8ca21f8701807ac9270')

build() {
  cd $_name-v$pkgver
  make
}

check() {
  cd $_name-v$pkgver
  lv2lint -Mpack -I bin/$_name "$_plugin_uri"
}

package() {
  depends+=(libfluidsynth.so)
  cd $_name-v$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -vDm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 Fluida/libscala-file/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-libscala-file
}
