pkgname=gogglesmm-git
pkgver=1.2.0
pkgrel=1
pkgdesc="Music Manager and Player"
url="https://gogglesmm.github.io"
license=('GPL3')
arch=('x86_64')
depends=('libepoxy'
         'glu'
         'libsm'
         'libxcursor'
         'libxrandr'
         'libxi'
         'libxft'
         'libvorbis'
         'libwebp'
         'libjpeg-turbo'
         'openssl'
         'libmad'
         'flac'
         'faad2'
         'opus'
         'taglib>=1.9.0'
         'sqlite'
         'dbus'
         'hicolor-icon-theme')

# Dependencies:
# expat => dbus
# libogg => libvorbis
# libxfixes => libxcursor
# libtiff => libwebp
#
# dbus => libpulse
# flac => libsndfile => libpulse
# openssl => libpulse


optdepends=('python2: import utilities'
            'libpulse: PulseAudio Output'
            'alsa-lib: ALSA Output')

makedepends=('cmake'
             'pkgconfig'
             'alsa-lib'
             'libpulse')

conflicts=('musicmanager')
replaces=('musicmanager')

md5sums=('SKIP')
source=("$pkgname"::'git+https://github.com/gogglesmm/gogglesmm.git')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  }

build() {
  cd "$pkgname"
  cmake .
  make
  }

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  }

