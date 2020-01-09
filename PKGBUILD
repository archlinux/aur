# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: Milk Brewster <milk on freenode>
_pkgname=stepseq.lv2
# Specify desired number of steps and notes! Different versions install just fine
# side by side.
_steps=16
_notes=8
pkgname=${_pkgname%%.lv2}_s${_steps}n${_notes}.lv2
pkgver=0.6.0
pkgrel=1
pkgdesc='Simple Step Sequencer (ajdust number of steps and notes in PKGBUILD)'
arch=(x86_64)
url='https://github.com/x42/stepseq.lv2'
license=('GPL')
groups=('lv2-plugins' 'proaudio')
depends=('pango' 'libglvnd')
makedepends=('lv2' 'cairo')
source=("git+https://github.com/x42/${_pkgname}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${_pkgname}"
  make submodules
  make N_NOTES=${_notes} N_STEPS=${_steps} -C misc boxmaker
  make N_NOTES=${_notes} N_STEPS=${_steps}
}

package() {
  cd "$srcdir/${_pkgname}"
  make N_NOTES=${_notes} N_STEPS=${_steps} PREFIX=/usr DESTDIR="$pkgdir/" install
}
