# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: archlinux at carstenfeuls dot de

pkgname=cumulus
pkgver=5.38.3
pkgrel=1
pkgdesc="Cumulus is a free and Open Source flight computer for Linux"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://www.kflog.org/cumulus/"
license=('custom')
depends=('qt5-base')
makedepends=('qt5-tools' 'dh-make')
source=("https://github.com/kflog-project/Cumulus/archive/refs/tags/$pkgver.tar.gz"
	'cumulus.desktop')
sha256sums=('4d40adb7176d7014cff4fc98a5d0155f258a7168da890235f3b991129a0afc4e'
            'efd04ecd966383d491dbd1fcfe22918c56653825a57c5778de56dc040e685087')

prepare() {
  cd "${srcdir}/Cumulus-$pkgver"
  #remove help, because for some reason it fails to install
  sed '/help/d' Makefile.X11 > Makefile.X11.1
  mv Makefile.X11.1 Makefile.X11

}
build() {
  cd "${srcdir}/Cumulus-$pkgver"
  make -f Makefile.X11 all
}

package() {
  cd "${srcdir}/Cumulus-$pkgver"
  install -d ${pkgdir}/usr/share/applications
  install --mode=644 ${srcdir}/cumulus.desktop ${pkgdir}/usr/share/applications/
  make INSTALL_ROOT=${pkgdir}/opt/cumulus -f Makefile.X11  install 
}
