# Maintainer: Luís Ferreira <contact@lsferreira.net>

pkgname=aurorafw-git
pkgver=r62.7a2733e
pkgrel=3
pkgdesc="A Powerful General Purpose Framework"
arch=('any')
url="https://gitlab.com/aurorafossorg/p/framework/core"
license=('GNU LGPLv3')
provides=('aurorafw')
conflicts=('aurorafw')
depends=('glfw' 'vulkan-headers' 'opengl-driver' 'libx11' 'freeimage' 'portaudio' 'libsndfile' 'glew' 'gtk3')
makedepends=('doxygen' 'meson' 'ninja' 'pkgconf')
source=('git+https://gitlab.com/aurorafossorg/p/framework/core.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/core"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  pushd "$srcdir/core"
  meson --buildtype=release . .build
  pushd .build
  ninja
  ninja install
  popd
  popd
}

