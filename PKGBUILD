# Maintainer: Xyne
# Contributor: Scott Garrett <Wintervenom@archlinux.us>
# Contributor: Thomas Dziedzic

_pkgname=lmms
pkgname=lmms-git
pkgver=0.9.92.r79.g6c920df
pkgrel=3
pkgdesc='The Linux MultiMedia Studio.'
url='http://lmms.sourceforge.net'
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl' 'glib2' 'fluidsynth' 'libpng' 'libvorbis' 'libxft' 'libxinerama' 'qt4' 'sdl_sound'
         'libsamplerate' 'shared-mime-info' 'fltk')
optdepends=('wine: VST support (experimental)'
            'fftw: SpectrumAnalyzer plugin'
            'stk: STK instruments plugins'
            'pulseaudio: PulseAudio output')
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
