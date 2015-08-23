# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=kodi-addon-xvdr
pkgver=0.9.8_83_g88265b8
_gitver=88265b86896513a219acb8d5f0c0f77956fae939
pkgrel=1
url="https://github.com/pipelka/xbmc-addon-xvdr"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
license=('GPL2')
pkgdesc="PVR add-on for XBMC to add VDR as a TV/PVR Backend"
replaces=('xbmc-addon-xvdr')
conflicts=('xbmc-addon-xvdr')
depends=('gcc-libs' 'kodi' 'zlib')
makedepends=('git')
source=("git+https://github.com/pipelka/xbmc-addon-xvdr.git#commit=$_gitver")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/xbmc-addon-xvdr"
  git describe --tags | sed 's/xvdr-//g;s/-/_/g'
}

build() {
  cd "${srcdir}/xbmc-addon-xvdr"
  ./autogen.sh

  ./configure --prefix=/usr/lib/kodi

  make
}

package() {
  cd "${srcdir}/xbmc-addon-xvdr"
  make DESTDIR="${pkgdir}" install
}
