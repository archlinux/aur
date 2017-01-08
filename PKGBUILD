pkgname=libwsclient-git
_gitname=libwsclient
pkgver=28.d416fcb
pkgrel=1
pkgdesc="WebSocket client library for C."
arch=('any')
url="https://github.com/payden/libwsclient"
makedepends=('make' 'gcc' 'libtool')
license=('GPL-3.0')
source=("git+https://github.com/payden/libwsclient.git")
sha256sums=('SKIP')

pkgver() {
    cd $_gitname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
  ./configure
  sed -i 's/\usr\/local/usr/g' Makefile
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install

  # cd ..
  # install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  # cd "$pkgdir/usr"
}
