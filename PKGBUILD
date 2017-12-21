# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=libcleri
pkgver=0.9.4
pkgrel=1
pkgdesc="C Left-Right Parser"
url="https://github.com/transceptor-technology/libcleri"
license=('MIT')
arch=('x86_64')
depends=('pcre2')
source=("https://github.com/transceptor-technology/libcleri/archive/${pkgver}.tar.gz" "makefile.targets.patch")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  patch -N < ../makefile.targets.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
 
  cd ./Release
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
 
  install -d "${pkgdir}/usr/include"
  install -d "${pkgdir}/usr/lib"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"
 
  cd ./Release
  make INSTALL_PATH="${pkgdir}/usr" DESTDIR="/usr" install
}

md5sums=('6d386bfdc0bd6e312012968819fee66e'
         '5033c2bd080fd8aed112e66c8ed7fa97')
