pkgname=ubertooth
pkgver=2018.08.R1
pkgrel=1
pkgdesc="A 2.4 GHz wireless development board suitable for Bluetooth experimentation. Open source hardware and software. Tools only"
url="http://sourceforge.net/projects/ubertooth/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('bluez-libs' 'libbtbb' 'libusbx' 'libpcap' 'python2-pyside' 'python2-numpy' 'python2-pyusb')
source=("https://github.com/greatscottgadgets/ubertooth/releases/download/2018-08-R1/ubertooth-2018-08-R1.tar.xz")
md5sums=('41a5c192c1f0b5df0516f4abd08ac995')

build() {
  cd "${srcdir}/${pkgname}-2018-08-R1/host/"
  mkdir -p build
  cd build
  cmake -DENABLE_PYTHON=FALSE -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DUDEV_RULES_PATH=${pkgdir}/etc/udev/rules.d -DINSTALL_UDEV_RULES=TRUE -DUDEV_RULES_GROUP=uucp ..
  make
  cd ../python/specan_ui
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-2018-08-R1/host/build/"
  make install
  cd ../python/specan_ui
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
