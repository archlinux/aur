# Maintainer: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=mirrorlist-manager
pkgver=1.3.1
pkgrel=1
pkgdesc="A Qt frontend for easy mirrorlist management"
arch=('x86_64')
url="https://github.com/Rizwan-Hasan/ArchLinux-Mirrorlist-Manager"
license=('GPL3')
depends=('python>=3.7.0' 'python-pyqt5>=5.11.2' 'python-pandas>=0.23.4' 'pacman-contrib')
makedepends=('cython>=0.28.5')
source=(Mirrorlist-Manager.tar.gz::"https://github.com/Rizwan-Hasan/ArchLinux-Mirrorlist-Manager/archive/v${pkgver}.tar.gz"
                             	  "mirrorist-manager.desktop.in"
                             	  "setup.py")
md5sums=('78d9cd38fbffa56e73ea7013b92bd2f4' 
		 'af01b7c426062910c37e65b98df7f207'
		 'f966222c78f492343e8f336bae1bdbf0')

build(){
	cd ${srcdir}/ArchLinux-Mirrorlist-Manager-*
	python3 ../setup.py build_ext --inplace
	rm -drv build *.c launcher*.so
}

package() {
  cd ${srcdir}/ArchLinux-Mirrorlist-Manager-*
  install -dm755 ${pkgdir}/usr/lib/mirrorlist-manager
  install -dm755 ${pkgdir}/usr/share/pixmaps
  install -dm755 ${pkgdir}/usr/share/applications
  install -dm755 ${pkgdir}/usr/bin/
  cp -avr launcher.py *.so *.ui *.data ${pkgdir}/usr/lib/mirrorlist-manager
  cp -v ${srcdir}/ArchLinux-Mirrorlist-Manager-*/icon/icon.png ${pkgdir}/usr/share/pixmaps/mirrorlist-manager.png
  cp -v "../mirrorist-manager.desktop.in" ${pkgdir}/usr/share/applications/mirrorist-manager.desktop
  cp -v ${srcdir}/ArchLinux-Mirrorlist-Manager-*/LICENSE ${pkgdir}/usr/lib/mirrorlist-manager/LICENSE.txt
  cd ${pkgdir}/usr/lib/mirrorlist-manager
  ln -sv launcher.py mirrorlist-manager
  ln -sv ../../usr/lib/mirrorlist-manager/launcher.py ${pkgdir}/usr/bin/mirrorlist-manager
}
