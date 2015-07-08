# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Martin Villagra <mvillagra0@gmail.com>

pkgname=qbittorrent-nogui
pkgver=3.2.0
pkgrel=1
pkgdesc="A bittorrent client based on Qt4 toolkit and libtorrent-rasterbar, w/o gui"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('GPL')
depends=('boost-libs'
         'libtorrent-rasterbar'
         'qt4')
makedepends=('boost'
             'which')
conflicts=('qbittorrent-git-nogui')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname/-nogui/}/${pkgname/-nogui/}-${pkgver}.tar.xz"
        'qbittorrent.service')
sha256sums=('51781cb121ebeda041fb348e649c4bd97888ee8c1d18328bc547d447b960d1b3'
            'be7b259e25cf8badb124672a7e9b3941708f17fd437089a72e838c599405a50c')

build() {
  cd "${srcdir}/${pkgname/-nogui/}-${pkgver}"
  ./configure --prefix=/usr --disable-gui
  make
}

package() {
  cd "${srcdir}/${pkgname/-nogui/}-${pkgver}"
  make INSTALL_ROOT=${pkgdir} install

  install -Dm755 "$srcdir/qbittorrent.service" "$pkgdir/usr/lib/systemd/system/qbittorrent.service"
}
