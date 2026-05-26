# Maintainer:  Joshua Holmer <jholmer.in@gmail.com>

_plug=tivtc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v2.4.g0cb2635
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/dubhater/vapoursynth-tivtc'
license=('MIT')
depends=('vapoursynth')
makedepends=('git'
  'meson'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-tivtc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson "../${_plug}" --reconfigure
  ninja
}

package() {
  PLUGINDIR=$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")

  install -Dm755 build/libtivtc.so "${pkgdir}${PLUGINDIR}/libtivtc.so"
}
