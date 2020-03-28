# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Pimper (M0Rf30)

_pkgname=npapi-vlc
pkgname=$_pkgname-git
_commit=784b0643c89878f589472b849bbc709d8846a926
pkgver=3.0.3.r1570.3.0.3
pkgrel=1
pkgdesc="The modern VLC Mozilla (NPAPI) plugin - Git version"
arch=('x86_64')
url="https://code.videolan.org/videolan/$_pkgname"
license=('GPL2+')
depends=('vlc')
makedepends=('git' 'gtk2' 'npapi-sdk')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!libtool')
source=("git+$url.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname

  echo $(git describe | cut -d "-" -f1-2 | tr - .).r$(git rev-list HEAD --count).$(git describe | cut -d "-" -f3)
}

prepare() {
  cd $_pkgname
  git submodule update --init
}

build() {
  cd $_pkgname

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
