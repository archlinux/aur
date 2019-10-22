# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=libcleri
pkgver=0.11.0
pkgrel=1
pkgdesc="C Left-Right Parser"
url="https://github.com/transceptor-technology/libcleri"
license=('MIT')
arch=('x86_64')
depends=('pcre2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/transceptor-technology/libcleri/archive/${pkgver}.tar.gz" "makefile.targets.patch")
sha256sums=('c57171ba6165585391cc671a564c60eaecd6f77d4bc98aa491ffdfd1c91a5abb'
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
