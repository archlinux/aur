# Maintainer: Oliver Freyermuth <o.freyermuth@googlemail.com>

pkgname=vapoursynth-plugin-mvutensils
pkgver=6
pkgrel=1
pkgdesc='MVUtensils plugin for VapourSynth'
arch=(x86_64)
url=https://github.com/myrsloik/mvutensils
license=(GPL-2.0-only)
depends=(
  fftw
  glibc
  libgcc
  libstdc++
  vapoursynth
)
makedepends=(
  git
  meson-python
  nasm
  python-build
  python-installer
)
source=(git+https://github.com/myrsloik/mvutensils.git#tag=v${pkgver})
sha256sums=('361125d36e43040122d03d54415a09d36f21100184c51532368ecdf54411b0e6')

prepare() {
  cd mvutensils
  sed 's|vapoursynth/include|/usr/include/vapoursynth|g' -i meson.build
}

build() {
  cd mvutensils
  python -m build --wheel --no-isolation
}

package(){
  python -m installer --destdir="$pkgdir" mvutensils/dist/vapoursynth_mvutensils-${pkgver}-*.whl
}

# vim: ts=2 sw=2 et:
