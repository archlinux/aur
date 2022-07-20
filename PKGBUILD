# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=libcalfbox-lss
pkgver=1.1.0
pkgrel=1
pkgdesc="Library for real time midi sequencing and loading of various sampler formats"
arch=(x86_64)
url="https://git.laborejo.org/lss/libcalfbox-lss"
license=(GPL3)
depends=(glibc)
makedepends=(fluidsynth glib2 jack libsndfile meson util-linux)
options=(debug)
source=(https://laborejo.org/downloads/$pkgname-$pkgver.tar.xz{,.sig})
sha512sums=('39f903805ac139bf3768b4632b7b34196dc9cd49e138b196ef56f634781ff59140d171938ecafbf2a8d43cca3cec488fd1b374f1eecdec98ebe823b8499ac262'
            'SKIP')
b2sums=('b2f9bb968adabe443e1c70a389441a781a29485501489e61411127b10ad68101fcbeea2d092b89ce8ed183be31dd966996bff6e99a6276eb55f2fcdaff47634a'
        'SKIP')
validpgpkeys=('45D952EF384ADFBB00913E3428C6A306F2909FEE') # Nils Hilbricht <nils@hilbricht.com>

build() {
  arch-meson build $pkgname-$pkgver
  ninja -vC build
}

check() {
  ninja test -vC build
}

package() {
  depends+=(libfluidsynth.so libglib-2.0.so libjack.so libsndfile.so libuuid.so)

  DESTDIR="$pkgdir" meson install -C build
}
