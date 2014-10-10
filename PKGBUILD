# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: zhuqin <zhuqin83@gmail.com>

pkgname=gtk-engine-murrine-git
pkgver=0.98.2.r406.2032a9b
pkgrel=1
pkgdesc="The marvelous gtk2 cairo engine (development version)"
arch=('i686' 'x86_64')
url="http://cimitan.com/murrine/"
license=('LGPL')
depends=('gtk2')
makedepends=('git' 'intltool')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=("${pkgname%-*}"::"git+https://git.gnome.org/browse/murrine"
        "newer-automakes.patch")
sha256sums=('SKIP'
            'f36037693603ca450a8bc7e2c0ba7269af18640123b87fc6dd2eb11b3e423be3')

pkgver() {
  cd "${pkgname%-*}"

  _ver=$(grep AC_INIT configure.ac | sed 's/[^0-9.]//g')
  _rev=$(git rev-list --count HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "$_ver.r%s.%s" "$_rev" "$_hash"
}

prepare() {
  cd "${pkgname%-*}"

  patch -Nup1 < ../newer-automakes.patch
}

build() {
  cd "${pkgname%-*}"

  ./autogen.sh --prefix=/usr --enable-animation --enable-animationrtl
  make
}

package() {
  make -C "${pkgname%-*}" DESTDIR="$pkgdir" install
}
