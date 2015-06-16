# Maintainer: Liviu Cristian Mirea-Ghiban <contact at liviucmg dot com>
pkgname=ksshaskpass4
pkgver=0.5.3
pkgrel=1
pkgdesc='ssh-add helper that uses kwallet and kpassworddialog. Compatible with KDE 4.x'
arch=('i686' 'x86_64')
url='http://kde-apps.org/content/show.php/Ksshaskpass?content=50971'
license=('GPL')
depends=('kwallet')
conflicts=('ksshaskpass' 'ksshaskpass-frameworks')
provides=('ksshaskpass' 'ksshaskpass-frameworks')
source=('http://kde-apps.org/CONTENT/content-files/50971-ksshaskpass-0.5.3.tar.gz' 'ksshaskpass.sh')
md5sums=('05dad7745e9d92b08bd86e7ab7a9540d'
         'aef2815fb704c98737f23eead3b4e894')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ksshaskpass-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -Dm 755 "$srcdir"/ksshaskpass.sh "$pkgdir"/etc/profile.d/ksshaskpass.sh
}
