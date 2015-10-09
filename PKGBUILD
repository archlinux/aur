# Contributor: ReNoM <renom@list.ru>
# Contributor: ava1ar <mail(dot)avatar(at)gmail(dot)com>

pkgname=kde-cdemu-manager-kf5
pkgver=0.5
pkgrel=3
pkgdesc="KDE CDEmu Manager is a simple frontend for CDEmu.KF5 version"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/KDE+CDEmu+Manager?content=99752"
license="GPL"
depends=('kdelibs4support' 'cdemu-daemon>=2.0')
provides=('kde-cdemu-manager')
conflicts=('kde-cdemu-manager')
makedepends=('cmake')
source=(http://www.kde-apps.org/CONTENT/content-files/99752-kde_cdemu-$pkgver.0.tar.bz2
        port_to_kf5.patch)
md5sums=('c0e56401e2c2f2c4652915a44af128b8'
        '4f51fb225789900df4db5d948cdeb71b')

prepare() {
  cd $srcdir/kde_cdemu
  patch -p1 < ../port_to_kf5.patch
}
build() {
  cd $srcdir/kde_cdemu
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` ..
  make
}

package()
{
  cd $srcdir/kde_cdemu/build
  make DESTDIR=$pkgdir install
}

