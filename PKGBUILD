# Maintainer: donarturo <arturwrona91 (at) gmail (dot) com>
pkgname=gmsynth-vsc55
_pkgname=gmsynth-VSC55.lv2
pkgver=r2.b784b19
pkgrel=1
pkgdesc="General MIDI LV2 Synth (VSC55). Modified version of gmsynth from x42 with microsoftgm waveset"
arch=('x86_64')
url="https://github.com/donarturo11/gmsynth-VSC55.lv2"
license=('GPL2')
groups=('pro-audio' 'lv2-plugins')
depends=('glibc' 'glib2' 'libfluidsynth.so')
makedepends=('lv2' 'git')
source=("git+https://github.com/donarturo11/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
cd "$srcdir/${_pkgname}"
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}	    



build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir/" PREFIX='/usr' install
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
