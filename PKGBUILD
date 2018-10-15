# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=libcleri
pkgver=0.10.0
pkgrel=1
pkgdesc="C Left-Right Parser"
url="https://github.com/transceptor-technology/libcleri"
license=('MIT')
arch=('x86_64')
depends=('pcre2')
source=("https://github.com/transceptor-technology/libcleri/archive/${pkgver}.tar.gz" "makefile.targets.patch")
sha256sums=('cbe9cd30188f6fac16a752acc5272f8354d7769cc39737ffaced3501abea7bc0'
            'c26ad2d1aea5cac6d536a93a55baeeb087c76946ddf549afe4f5e1bbe60388c9')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  patch -Np1 -i ${srcdir}/makefile.targets.patch
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
