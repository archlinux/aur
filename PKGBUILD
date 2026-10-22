# Maintainer: acroarch
# Contributor: falkTX <falktx@falktx.com>

pkgname=clara-git
pkgver=1.1.2
pkgrel=4
pkgdesc="Audio Plugin Host (fork with UI/UX enhancements, modal tools, dynamic cable gradients, and session safety)"
arch=('x86_64')
url="https://github.com/acropolis914/Clara"
license=('GPL-2.0-or-later')
depends=(
  'alsa-lib'
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxrandr'
  'qt6-wayland'
  'wayland'
   'python-rich'
  'python-pyqt6'
  'sdl2'
  'qt6-base'
  'qt6-svg'
  'fluidsynth'
  'liblo'
  'file'
  'libsndfile'
  'ttf-nerd-fonts-symbols'
)
makedepends=(
  'git'
  'pkgconf'
  'python'
)
optdepends=(
  'jack: for using carla with JACK'
  'lv2-host: for the LV2 plugin'
  'vst-host: for the VST plugin'
  'python-pyliblo: OSC control support'
  'python-rdflib: LADSPA-RDF support'
)
provides=('carla' 'carla-git' 'clara' 'clara-git' 'clap-host' 'dssi-host' 'ladspa-host' 'lv2-host' 'vst3-host' 'vst-host')
conflicts=('carla' 'carla-git' 'clara' 'clara-git')
source=("git+https://github.com/acropolis914/Clara.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Clara"
  git describe --long --tags --abbrev=8 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "2.6.0.r0"
}

build() {
  cd "$srcdir/Clara"
  make DEFAULT_QT=6
}

package() {
  cd "$srcdir/Clara"
  make PREFIX=/usr DESTDIR="$pkgdir" DEFAULT_QT=6 install
}
