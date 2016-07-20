# Maintainer: Christoph Haag <haagch+aur@frickel.club> 

_pkgname=psmoveinput
pkgname=${_pkgname}-git
pkgver=0.4.1.r0.gb4a51a0
pkgrel=1
pkgdesc="userspace Linux input driver that uses data from PSMove motion controller to inject events to kernel's input subsystem"
arch=(i686 x86_64)
url="https://github.com/MooseTheBrown/psmoveinput"
license=('GPL3')
depends=('psmoveapi-git' 'boost-libs')
makedepends=('cmake')
source=(${_pkgname}::git+https://github.com/MooseTheBrown/psmoveinput.git)
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  sed -i "s/boost_thread-mt/boost_thread/g" CMakeLists.txt
  sed -i "s/boost_program_options-mt/boost_program_options/g" CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR=lib .
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

