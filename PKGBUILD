# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Martin Villagra <mvillagra0@gmail.com>

pkgname=qbittorrent-nogui
_pkgname=qbittorrent
pkgver=3.3.0
pkgrel=1
pkgdesc="A bittorrent client based on Qt4 toolkit and libtorrent-rasterbar, w/o gui"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('GPL')
depends=('boost-libs'
         'libtorrent-rasterbar'
         'qt5-base')
makedepends=('boost'
             'qt5-tools'
             'which')
conflicts=('qbittorrent-git-nogui')
source=("http://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"
        'qbittorrent.service')
sha256sums=('ded08fcc1cf227700b81020395166541cd8c63efb2cbdfc97ac62be6458dbddb'
            '912bb191cd942131b23d6d6b9a53d2dbbcd86247c3236f68e62c2c1e13393942')

build() {
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-gui --with-qt5
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make INSTALL_ROOT=${pkgdir} install

  install -Dm755 "$srcdir/qbittorrent.service" "$pkgdir/usr/lib/systemd/system/qbittorrent.service"
}
