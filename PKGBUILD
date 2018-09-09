# Maintainer: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=gui-sudo
pkgver=1.0
pkgrel=2
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
                           "gui-sudo.desktop"
                           "setup.py")
md5sums=('7722b1a274170f0f26883927cc9fa734' 
		 '1635efcdbfcfb6fb1678fe808e706935'
		 'f966222c78f492343e8f336bae1bdbf0')

build(){
	cd ${srcdir}/GUI-Sudo*
	python3 ../setup.py build_ext --inplace
	rm -drv build *.c
}

package() {
  cd ${srcdir}/GUI-Sudo*
  install -d ${pkgdir}/opt/GUI-Sudo
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/applications
  cp -v *.so ${pkgdir}/opt/GUI-Sudo/
  cp -v *.ui ${pkgdir}/opt/GUI-Sudo/
  cp -v LICENSE ${pkgdir}/opt/GUI-Sudo/
  cp -v main.py ${pkgdir}/opt/GUI-Sudo/
  cp -v icons/icon.png ${pkgdir}/opt/GUI-Sudo/
  ln -sv ../../opt/GUI-Sudo/main.py ${pkgdir}/usr/bin/gui-sudo
  ln -sv ../../opt/GUI-Sudo/main.py ${pkgdir}/usr/bin/gksu
  cp -v ../gui-sudo.desktop ${pkgdir}/usr/share/applications/
  chmod 777 ${pkgdir}/usr/share/applications/gui-sudo.desktop
  chmod +x ${pkgdir}/usr/share/applications/gui-sudo.desktop
  chmod +x ${pkgdir}/opt/GUI-Sudo/*.py
  cd ${pkgdir}/opt/GUI-Sudo/
  ln -sv main.py gui-sudo
}
