# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=keybinder
pkgname=python2-keybinder2
pkgver=0.3.1
pkgrel=3
pkgdesc='Library for registering global keyboard shortcuts (Python 2 bindings)'
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url='https://github.com/kupferlauncher/keybinder'
license=('GPL')
depends=('pygtk' 'libkeybinder2')
makedepends=('gobject-introspection')
options=('!emptydirs')
source=("https://github.com/kupferlauncher/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-$pkgver.tar.gz")
sha256sums=('879f07130ac64792ddb9fd758e6673119283bda37d75573787ae22af8684a240')

build() {
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr PYTHON=python2 --disable-lua
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  make -C docs DESTDIR="${pkgdir}" uninstall
  make -C libkeybinder DESTDIR="${pkgdir}" uninstall
}

