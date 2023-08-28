# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Alexander Epaneshnikov <aarnaarn2@gmail.com>
# Contributor: Kyle <kyle@gmx.ca>

pkgname=pcaudiolib-git
pkgver=1.2.r9.g494e7cd
pkgrel=1
pkgdesc='Portable C Audio Library (development version)'
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url=https://github.com/espeak-ng/pcaudiolib
license=('GPL3')
optdepends=('alsa-lib: ALSA output support'
            'pulseaudio: Pulseaudio output support')
makedepends=('git' 'automake' 'autoconf')
provides=( pcaudiolib )
conflicts=( pcaudiolib )
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  ./autogen.sh
}

build() {
  cd "${pkgname%-git}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
