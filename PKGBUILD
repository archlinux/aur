# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=fogpad
pkgver=1.0.0
pkgrel=2
pkgdesc='A reverb in which reflections can be frozen, filtered, pitch shifted and disintegrated'
arch=(aarch64 x86_64)
url='https://github.com/linuxmao-org/fogpad-port'
license=(MIT)
depends=(cairo gcc-libs)
makedepends=(jack libglvnd)
provides=($pkgname.lv2)
groups=(pro-audio lv2-plugins vst-plugins)
optdepends=(
  'jack: for running the JACK stand-alone application'
  'lv2-host: for loading the LV2 plugin'
  'vst-host: for loading the VST2 plugin'
)
source=("https://github.com/linuxmao-org/fogpad-port/releases/download/v$pkgver/$pkgname-port-$pkgver.tar.gz")
sha256sums=('75b39c7546a8ee22b82a7af34ffbd6c18867599236df9aa7e9e0b1ee9e3d6a9f')

build() {
  cd $pkgname-port-$pkgver
  make PREFIX=/usr
}

package() {
  depends=(libjack.so)
  cd $pkgname-port-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  # License
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
