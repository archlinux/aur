# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: joyfulgirl@archlinux.us
# Contributor: nathan owe ndowens04 at gmail dot com

pkgname=cclive
pkgver=0.9.3
pkgrel=4
pkgdesc='Commandline downloader for popular video websites.'
arch=('i686' 'x86_64')
url='http://cclive.sourceforge.net/'
license=('AGPL3')
depends=('boost-libs' 'pcre' 'curl' 'libquvi' 'glibmm')
makedepends=('boost')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz"
        iostream.patch)
md5sums=('c336f97e29327d92ead62765a0ef0b65'
         'd5a2f6aee7832683bcffe2ea6b1561ad')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../iostream.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr boost_cv_rpath_link_ldflag="-L/usr/lib"
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
