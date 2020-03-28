# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: LightDot <lightdot -a-t- g m a i l>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=npapi-vlc
pkgver=3.0.3
pkgrel=1
pkgdesc="The modern VLC Mozilla (NPAPI) plugin."
arch=('x86_64')
url="https://code.videolan.org/videolan/npapi-vlc"
license=('GPL')
depends=('gtk2' 'vlc')
makedepends=('git' 'npapi-sdk')
# This package uses version tags from Git, because there are no official releases
source=("git+https://code.videolan.org/videolan/$pkgname.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule update --init
}

build() {
  cd "$pkgname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
