
# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=npapi-vlc
pkgver=2.2.6
pkgrel=1
pkgdesc="The modern VLC Mozilla (NPAPI) plugin."
arch=('x86_64')
url="https://code.videolan.org/videolan/npapi-vlc"
license=('GPL')
depends=('gtk2' 'vlc')
makedepends=('git' 'npapi-sdk')
# This package uses version tags from Git, because there are no official releases
source=("git+https://code.videolan.org/videolan/$pkgname.git#tag=$pkgver"
        "git+https://code.videolan.org/videolan/libvlcpp.git")
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.vlcpp.url "$srcdir/libvlcpp"
  git submodule update
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
}
