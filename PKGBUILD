# Maintainer: liushuyu
# Contributor: Xyne
# Contributor: Scott Garrett <Wintervenom@archlinux.us>
# Contributor: Thomas Dziedzic

_pkgname=lmms
pkgname=lmms-qt5-git
pkgver=1.1.90.r145.gd31ad89
pkgrel=1
pkgdesc='The Linux MultiMedia Studio (Qt5 Version).'
url='http://lmms.io'
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt5-base' 'libsamplerate' 'fluidsynth' 'zynaddsubfx' 'libxft' 
'libxinerama' 'shared-mime-info' 'alsa-lib')
optdepends=('wine: VST support (experimental, currently nearly unusable on Arch Linux)'
            'fftw: SpectrumAnalyzer plugin'
            'jack: Optional JACK audio backend'
            'portaudio: Optional Portaudio audio backend'
            'sdl_sound: Optional SDL audio backend'
            'pulseaudio: Optional PulseAudio backend'
            'oss: Optional OSS backend'
            'libsoundio: For soundio support')
makedepends=('git' 'cmake' 'ladspa' 'raptor' 'rasqal' 'libxft' 'freetype2' 'redland' 'gcc-multilib')
options=('!strip')
provides=('lmms')
conflicts=('lmms' 'lmms-git')
source=('git+https://github.com/LMMS/lmms.git')
sha512sums=('SKIP')
install="$pkgname".install

pkgver() {
  cd -- "$srcdir/$_pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd -- "$srcdir/$_pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DWANT_QT5=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make #-j1
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
