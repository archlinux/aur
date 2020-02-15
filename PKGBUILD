# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Kyle <kyle@gmx.ca>
pkgname=pcaudiolib-git
_gitname=pcaudiolib
pkgver=1.1.2.gd6a6b00 # determined from git origin
pkgrel=3
pkgdesc="Portable C Audio Library (git version)"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/rhdunn/pcaudiolib"
license=('GPL3')
depends=()
optdepends=('alsa-lib: ALSA output support'
            'pulseaudio: Pulseaudio output support')
makedepends=('git' 'automake' 'autoconf')
provides=( pcaudiolib )
conflicts=( pcaudiolib )
source=('git+https://github.com/rhdunn/pcaudiolib.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
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
