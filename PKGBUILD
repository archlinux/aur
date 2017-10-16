# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=lmms-beta
_basever=1.2.0
_rc=rc4
pkgver=${_basever}_${_rc}
pkgrel=3
pkgdesc='Beta version of the Linux MultiMedia Studio.'
arch=('x86_64')
url='https://lmms.io/'
license=('GPL')
depends=('sdl' 'glib2' 'fluidsynth' 'libpng' 'libvorbis' 'libxft' 'libxinerama' 'qt4' 'sdl_sound'
         'libsamplerate' 'shared-mime-info' 'fltk')
optdepends=('wine: VST support (experimental)'
            'fftw: SpectrumAnalyzer plugin'
            'stk: STK instruments plugins'
            'pulseaudio: PulseAudio output')
makedepends=('cmake' 'ladspa' 'libxft' 'freetype2' 'fftw' 'stk' 'wine')
makedepends_x86_64=('gcc-multilib')
provides=('lmms' 'lmms-extras')
conflicts=('lmms' 'lmms-extras')
options=('!makeflags')
source=("https://github.com/LMMS/lmms/archive/v${_basever}-${_rc}.tar.gz")
md5sums=('cd2d77dfe750b6e42de1ca68543aa7fe')

prepare() {
  cd "${srcdir}/lmms-${_basever}-${_rc}"

  sed -i 's|lib64|lib|g' cmake/modules/DetectMachine.cmake
}

build() {
  cd "${srcdir}/lmms-${_basever}-${_rc}"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DWANT_QT5=ON -DWANT_VST=ON -USE=vst
  make -j4
}

package() {
  cd "$srcdir/lmms-${_basever}-${_rc}"
  make DESTDIR="${pkgdir}" install
}
