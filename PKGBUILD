# Maintainer: Jens Staal <staal1978@gmail.com>
pkgname=libcr75-git
pkgver=r22.a133cb0
pkgrel=1
pkgdesc="A PCSC driver for the Transcend CR-75 card reader (for example Sitecom e-ID reader)"
arch=('x86_64')
url="https://github.com/jordidg/libcr75"
license=('LGPL')
depends=('libusb' 'pcsclite')
makedepends=('cmake')
source=('git+https://github.com/jordidg/libcr75.git')
sha256sums=('SKIP')

build() {
  cd "${srcdir}"/libcr75
  #make sure that the wanted branch is active
  git checkout master
  rm -rf "${srcdir}"/build
  mkdir "${srcdir}"/build
  cd "${srcdir}"/build
  cmake -DCMAKE_BUILD_TYPE=Release "${srcdir}"/libcr75 
  make
}

pkgver() {
  cd "${srcdir}"/libcr75
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="$pkgdir" install
}

 
