# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_projectname='Kapitonov-Plugins-Pack'
pkgname=kpp
pkgver=1.2.1
pkgrel=2
pkgdesc='Kapitonov Plugins Pack for guitar sound processing'
arch=(x86_64 aarch64)
url='https://kpp-tubeamp.com/'
license=(GPL3)
groups=(ladspa-plugins lv2-plugins pro-audio)
depends=(cairo gcc-libs xcb-util xcb-util-wm)
makedepends=(boost faust ladspa lv2 meson libxcb zita-convolver zita-resampler)
optdepends=('ladspa-host: for running the LADSPA plugins'
            'lv2-host: for running the LV2 plugins')
source=("$pkgname-$pkgver.tar.gz::https://github.com/olegkapitonov/$_projectname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('056c152ee72c5a0cfd45ca0cd848ff13b098c8f58b14c26ad06d7ef49c792b40')

build() {
  arch-meson $_projectname-$pkgver build
  meson compile -C build
}

package() {
  depends+=(libzita-convolver.so libzita-resampler.so)
  meson install -C build --destdir "$pkgdir"
}
