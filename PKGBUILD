# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Martin Villagra <mvillagra0@gmail.com>

pkgname=qbittorrent-nogui
_pkgname=qbittorrent
pkgver=3.2.4
pkgrel=1
pkgdesc="A bittorrent client based on Qt4 toolkit and libtorrent-rasterbar, w/o gui"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('GPL')
depends=('boost-libs'
         'libtorrent-rasterbar'
         'qt5-base')
makedepends=('boost'
             'which')
conflicts=('qbittorrent-git-nogui')
source=("http://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"
        'qbittorrent.service')
sha256sums=('7fc128e2809c3be4ea543cfaeefd922e0327cc430330eaad0d3ec7616df51871'
            '1ff08eeaa997f4bd58d692a311f028c11bf8e18983e9b9908e2da50cc71798b9')

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
