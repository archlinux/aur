# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Matías Hernández <msdark(at)archlinux(dot)cl>
# Contributor: Hugo Ideler <hugoideler(at)dse(dot)nl>

pkgname=ideviceinstaller
pkgver=1.1.1
pkgrel=1
pkgdesc="Manage Applications of an iPhone or iPod Touch"
arch=('i686' 'x86_64')
url="http://www.libimobiledevice.org/"
license=('GPL2')
depends=('usbmuxd' 'libzip') 
source=("https://github.com/libimobiledevice/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b1401678a61f28c4aca95375c100b5a83ccc2cdfa0222c0de7ad0a2cfb4e3c9f')

build() {
  cd ${pkgname}-${pkgver}

  sed -i "/AS_COMPILER_FLAGS(/s/-Werror//" configure.ac
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}
