# Maintainer : Rob McCathie <korrode at gmail>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: vinz <vinz@archlinux.us>
# Contributor: Aurélien DESBRIÈRES <ice.cube@gmx.com>

pkgname=thunar-shares-plugin
pkgver=0.2.0.git
_gitcommit=053cc4e0dc484081def59769efbe3a544fe169bc
pkgrel=2
pkgdesc="Thunar plugin to quickly share a folder using Samba without requiring root access"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/thunar-plugins/${pkgname}"
license=('GPL2' 'LGPL')
depends=('thunar' 'samba')
makedepends=('xfce4-dev-tools')
install="${pkgname}.install"
source=("http://git.xfce.org/thunar-plugins/thunar-shares-plugin/snapshot/thunar-shares-plugin-${_gitcommit}.tar.bz2"
        "drop-thunar-vfs.patch::http://git.xfce.org/thunar-plugins/thunar-shares-plugin/patch/?id=3a89ca67b27d717b13fed7851fce3244f31fc94e")
sha1sums=('a6c4ca62f34fc26bde7ec94f5fcc5d9b6593b282'
          '29a0e3c31e1e48008c781c3575915398ec9e502b')

prepare() {
  cd "${srcdir}/${pkgname}-${_gitcommit}"
  patch -Np1 -i "${srcdir}/drop-thunar-vfs.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${_gitcommit}"
  ./autogen.sh --prefix=/usr --enable-debug=no
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_gitcommit}"
  make DESTDIR="${pkgdir}" install
}
