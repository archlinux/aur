# Maintainer: Kyle <kyle@gmx.ca>
pkgname=pcaudiolib-git
_gitname=pcaudiolib
pkgver=b5b2860 # determined from git origin
pkgrel=1
pkgdesc="Portable C Audio Library (git version)"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/rhdunn/pcaudiolib"
license=('GPL3')
depends=()
optdepends=('alsa-lib: ALSA output support'
  'pulseaudio: Pulseaudio output support')
makedepends=('git')
provides=()
conflicts=()
source=('git+https://github.com/rhdunn/pcaudiolib.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed -e 's|v||' -e 's|-|.|g'
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
