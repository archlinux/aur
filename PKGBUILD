# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor : speps <speps at aur dot archlinux dot org>
_pkgbasename=distrho-lv2
pkgname=${_pkgbasename}-git
pkgver=r492.062a0f61
pkgrel=3
pkgdesc="Distrho LV2 Audio Plugins, using the JUCE Toolkit"
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'GPL3')
depends=('gcc-libs' 'lv2' 'libxext' 'freetype2' 'alsa-lib')
makedepends=('git' 'meson' 'libxinerama' 'libxrender' 'libxcursor' 'ladspa')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}" 'distrho-plugins' 'distrho-plugins-lv2-git')
source=("${_pkgbasename}::git://github.com/DISTRHO/DISTRHO-Ports.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbasename}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgbasename}"

  meson build --buildtype release
  meson configure build -Dprefix="${pkgdir}/usr" -Dbuild-vst2=false -Dbuild-vst3=false
  ninja -C build
}

package() {
  cd "${srcdir}/${_pkgbasename}"

  ninja -C build install
}
