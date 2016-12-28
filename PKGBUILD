# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=pd-git
_name=pd
pkgver=0.47.1.r6.gbd939d1
pkgrel=1
pkgdesc="The Pure Data real-time music and multimedia environment"
arch=('i686' 'x86_64')
url="http://msp.ucsd.edu/software.html"
license=('custom:BSD')
depends=('jack' 'tk' 'fftw')
provides=('puredata')
options=('!strip' '!buildflags')
source=("${_name}::git://git.code.sf.net/p/pure-data/pure-data"
        "${_name}.desktop")
md5sums=('SKIP'
         'c12f07e8c18f8bde9c094ced3485c936')

pkgver() {
  cd ${_name}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_name}
  ./autogen.sh
  ./configure --prefix=/usr \
              --enable-alsa \
              --enable-jack \
              --disable-portaudio \
              --enable-fftw=no \
              --enable-debug
  make
}

package() {
  cd ${_name}
  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/pd/LICENSE"
  # desktop file
  install -Dm644 $srcdir/${_name}.desktop \
  $pkgdir/usr/share/applications/${_name}.desktop
}

# vim:set ts=2 sw=2 et:
