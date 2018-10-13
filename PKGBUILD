# Maintainer: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=gui-sudo
pkgver=1.0
pkgrel=3
pkgdesc="Graphical user interface for sudo"
arch=('x86_64')
url="https://github.com/Rizwan-Hasan/GUI-Sudo"
license=('GPL3')
depends=('python>=3.7.0' 
		 'python-pyqt5>=5.11.2' 
		 'python-sip-pyqt5>=4.19.12' 
		 'pyqt5-common>=5.11.2' 
		 'qt5-base>=5.11.1')
makedepend=('python>=3.7.0' 'cython>=0.28.5')
conflicts=('gksu' 'libgksu')
source=(${pkgname}.tar.gz::"https://github.com/Rizwan-Hasan/GUI-Sudo/archive/master.tar.gz"
                           "gui-sudo.desktop.in"
                           "setup.py")
md5sums=('e185b4a3e1bc9a89d5ff5d20e26c8790' 
		 '9e8aa2f0dcdfec8313851dfb54bec4d8'
		 'f966222c78f492343e8f336bae1bdbf0')

build(){
	cd ${srcdir}/GUI-Sudo*
	python3 ../setup.py build_ext --inplace
	rm -drv build *.c
}

package() {
  cd ${srcdir}/GUI-Sudo*
  install -d ${pkgdir}/usr/share/GUI-Sudo
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/pixmaps
  install -d ${pkgdir}/usr/share/applications
  cp -v *.so ${pkgdir}/usr/share/GUI-Sudo/
  cp -v *.ui ${pkgdir}/usr/share/GUI-Sudo/
  cp -v LICENSE ${pkgdir}/usr/share/GUI-Sudo/
  cp -v main.py ${pkgdir}/usr/share/GUI-Sudo/
  cp -v icons/icon.png ${pkgdir}/usr/share/pixmaps/gui-sudo.png
  ln -sv ../../usr/share/GUI-Sudo/main.py ${pkgdir}/usr/bin/gui-sudo
  ln -sv ../../usr/share/GUI-Sudo/main.py ${pkgdir}/usr/bin/gksu
  cp -v ../gui-sudo.desktop.in ${pkgdir}/usr/share/applications/gui-sudo.desktop
  # chmod 777 ${pkgdir}/usr/share/applications/gui-sudo.desktop
  # chmod +x ${pkgdir}/usr/share/applications/gui-sudo.desktop
  chmod +x ${pkgdir}/usr/share/GUI-Sudo/*.py
  cd ${pkgdir}/usr/share/GUI-Sudo/
  ln -sv main.py gui-sudo
}
