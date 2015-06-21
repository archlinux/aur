# Maintainer: Xyne
# Contributor: Scott Garrett <Wintervenom@archlinux.us>
# Contributor: Thomas Dziedzic

_pkgname=lmms
pkgname=lmms-git
pkgver=0.9.92.r79.g6c920df
pkgrel=2
pkgdesc='The Linux MultiMedia Studio.'
url='http://lmms.sourceforge.net'
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4' 'sdl_sound' 'jack' 'libsamplerate' 'fluidsynth' 'zynaddsubfx' 'portaudio' 'libxft' 'libxinerama' 'shared-mime-info')
optdepends=('wine: VST support (experimental)'
            'fftw: SpectrumAnalyzer plugin' )
makedepends=('git' 'cmake' 'ladspa' 'raptor' 'rasqal' 'libxft' 'freetype2' 'redland' 'gcc-multilib')
provides=('lmms')
conflicts=('lmms')

source=('git://github.com/LMMS/lmms.git')
sha512sums=('SKIP')

install="$pkgname".install

pkgver() {
  cd -- "$srcdir/$_pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd -- "$srcdir/$_pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make #-j1
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
