# Contributor: 3ED <krzysztof1987@gmail.com>

pkgname=freeme2-svn
_svnmod=freeme2
pkgver=80
pkgrel=2
pkgdesc="It strips wm-drm protection from wmv/asf/wma files as well as video/audio streams."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/freeme2/"
license=('GPL')
depends=('openssl')
makedepends=('subversion')
provides=('freeme2')
conflicts=('freeme2')
source=("${_svnmod}::svn+https://svn.code.sf.net/p/freeme2/code/"
        "01-automake_1.13.patch")
sha256sums=('SKIP'
            '8303d1da6bc16a8f810a355a41cef2bb03926db654db51bcab5abb319ed65a30')

pkgver() {
  cd ${_svnmod}
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$_svnmod"
  patch -Np1 -i "$srcdir/01-automake_1.13.patch"
}

build() {
  cd "$_svnmod"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_svnmod"
  make DESTDIR="$pkgdir" install
}
