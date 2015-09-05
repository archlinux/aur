# Maintainer: Ondrej Jirman <megous@megous.com>

pkgname=megatools
pkgver=1.9.95
pkgrel=2
pkgdesc="Command line client application for Mega.co.nz"
arch=('i686' 'x86_64')
url="http://megatools.megous.com"
license=('GPL')
depends=('curl' 'glib-networking' 'fuse')
makedepends=('gobject-introspection')
optdepends=('gobject-introspection: Bindings support for JavaScript')
source=(mega.nz.patch
        "http://megatools.megous.com/builds/megatools-${pkgver}.tar.gz")
options=(!libtool)
md5sums=('6cfbc84ff6fb8351838bc7ab682f8a12'
         '93c7762196af8ed90920084df03210fb')

prepare() {
    cd "megatools-${pkgver}"

    # Mega.nz support
    # https://github.com/megous/megatools/commit/9da13bb
    patch -Np1 -i ../mega.nz.patch
}

build() {
  cd "megatools-${pkgver}"

  ./configure --prefix=/usr

  make
}

package() {
  cd "megatools-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
