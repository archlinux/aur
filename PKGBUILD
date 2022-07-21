# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
pkgname=i2p-controller
pkgver=1.1
pkgrel=2
pkgdesc="GUI I2P Controller written in python."
url="http://sourceforge.net/projects/i2pcontroller/"
arch=('any')
license=('GPLv3' 'GPLv2')
depends=('python-pyqt4' 'python' 'xdg-utils' 'i2p')
source=("https://github.com/GIJack/i2pcontroller/raw/master/release/i2pcontroller_${pkgver}.tar.gz")
sha256sums=('9b054725decafa61d90239ea4fe4716b1f8e3e7da45d3bb284f427f96b1b6f16')

build() {
  cd "${srcdir}"
  #compile into bytecode
  python -m py_compile i2pcontroller.py mainwindow.py # precompile bytecode
}
 
package() {
  cd "${pkgdir}"
  #make directories
  mkdir -p usr/share/i2pcontroller
  mkdir -p usr/bin
  mkdir -p usr/share/applications

  #copy files
  mv "${srcdir}/i2pcontroller.py" usr/share/i2pcontroller/
  mv "${srcdir}/mainwindow.py" usr/share/i2pcontroller/
  mv "${srcdir}/__pycache__/"* usr/share/i2pcontroller/
  mv "${srcdir}/wrapper.config" usr/share/i2pcontroller/

  install -Dm755 "${srcdir}/ip2controller" usr/bin/i2pcontroller
  mv "${srcdir}/i2prouter" usr/share/i2pcontroller/
  mv "${srcdir}/i2pcontroller.desktop" usr/share/applications/
  #rename compiled files
  cd usr/share/i2pcontroller
  #mv i2pcontroller.cpython-3?.pyc i2pcontroller.pyc
  #mv mainwindow.cpython-3?.pyc mainwindow.pyc
}
 
# vim:set ts=2 sw=2 et:

