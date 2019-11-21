# Maintainer: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=hash-checker
pkgver=2.1
pkgrel=8
pkgdesc="A Free tool for checking any file's MD5, SHA256 & SHA512 hash easily"
arch=('x86_64')
url="https://github.com/Rizwan-Hasan/Hash-Checker/"
license=('MIT')
depends=('python>=3.7.0' 'python-pyqt5>=5.11.2' 'python-sip-pyqt5>=4.19.12' 'pyqt5-common>=5.11.2' 'python-pyperclip>=1.6.2' 'python-packaging>=17.1')
makedepends=('cython>=0.28.5')
source=(Hash-Checker.tar.gz::"https://github.com/Rizwan-Hasan/Hash-Checker/archive/v${pkgver}.tar.gz"
                             "hash-checker.desktop.in"
                             "setup.py")
md5sums=('66f6ea663a0206e980bfc96cd8c83685' 
		 '8410509a75061eb1532f2b85e6f18e11'
		 'f966222c78f492343e8f336bae1bdbf0')

build(){
	cd ${srcdir}/Hash-Checker-${pkgver}
	python3 ../setup.py build_ext --inplace
	rm -drv build *.c  
}

package() {
  cd ${srcdir}/Hash-Checker-${pkgver}
  install -dm755 ${pkgdir}/usr/share/Hash-Checker
  install -dm755 ${pkgdir}/usr/share/applications
  install -dm755 ${pkgdir}/usr/bin/
  cp -avr *.so main.py ui ${pkgdir}/usr/share/Hash-Checker/
  cp -v ${srcdir}/Hash-Checker-${pkgver}/icons/icon.png ${pkgdir}/usr/share/Hash-Checker/
  cp -v "../hash-checker.desktop.in" ${pkgdir}/usr/share/applications/hash-checker.desktop
  # chmod 777 "${pkgdir}/usr/share/applications/hash-checker.desktop"
  # chmod +x "${pkgdir}/usr/share/applications/hash-checker.desktop"
  cp -v ${srcdir}/Hash-Checker-${pkgver}/LICENSE ${pkgdir}/usr/share/Hash-Checker/LICENSE.txt
  cd ${pkgdir}/usr/share/Hash-Checker
  ln -sv main.py hash-checker
  ln -sv ../../usr/share/Hash-Checker/main.py ${pkgdir}/usr/bin/hash-checker
}
