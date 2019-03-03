# Maintainer: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=mirrorlist-manager
pkgver=1.1
pkgrel=0
pkgdesc="A Qt frontend for easy mirrorlist management"
arch=('x86_64')
url="https://github.com/Rizwan-Hasan/ArchLinux-Mirrorlist-Manager"
license=('GPL3')
depends=('python>=3.7.0' 'python-pyqt5>=5.11.2' 'python-sip-pyqt5>=4.19.12' 'pyqt5-common>=5.11.2' 'python-pandas>=0.23.4' 'pacman-contrib')
makedepends=('cython>=0.28.5')
source=(Mirorlist-Manager.tar.gz::"https://github.com/Rizwan-Hasan/ArchLinux-Mirrorlist-Manager/archive/v${pkgver}.tar.gz"
                             "mirrorist-manager.desktop.in"
                             "setup.py")
md5sums=('23ffd224f2d1f22f5fc4ffeff311aa02' 
		 'f4b24cc51be8021af331dc1dd601ada0'
		 'f966222c78f492343e8f336bae1bdbf0')

build(){
	cd ${srcdir}/ArchLinux-Mirrorlist-Manager-*
	python3 ../setup.py build_ext --inplace
	rm -drv build *.c launcher*.so
}

package() {
  cd ${srcdir}/ArchLinux-Mirrorlist-Manager-*
  install -dm755 ${pkgdir}/usr/share/ArchLinux-Mirrorlist-Manager
  install -dm755 ${pkgdir}/usr/share/pixmaps
  install -dm755 ${pkgdir}/usr/share/applications
  install -dm755 ${pkgdir}/usr/bin/
  cp -avr launcher.py *.so *.ui *.data ${pkgdir}/usr/share/ArchLinux-Mirrorlist-Manager/
  cp -v ${srcdir}/ArchLinux-Mirrorlist-Manager-*/icon/icon.png ${pkgdir}/usr/share/pixmaps/mirrorlist-manager.png
  cp -v "../mirrorist-manager.desktop.in" ${pkgdir}/usr/share/applications/mirrorist-manager.desktop
  cp -v ${srcdir}/ArchLinux-Mirrorlist-Manager-*/LICENSE ${pkgdir}/usr/share/ArchLinux-Mirrorlist-Manager/LICENSE.txt
  cd ${pkgdir}/usr/share/ArchLinux-Mirrorlist-Manager
  ln -sv launcher.py mirrorlist-manager
  ln -sv ../../usr/share/ArchLinux-Mirrorlist-Manager/launcher.py ${pkgdir}/usr/bin/mirrorlist-manager
}
