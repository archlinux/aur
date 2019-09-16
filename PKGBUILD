# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=coreaction
pkgver=2.7.0
pkgrel=2
pkgdesc="A side bar for showing widgets from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'libcprime' 'libcsys')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        '0001-fix-conflicting-path-in-brightness.patch')
md5sums=('b2f80408568abba68a2ef3b92bda9deb'
         '9d0bcf2721cbeac7a90f15c8f7ae6f4d')

prepare() {
  cd ${pkgname}-v${pkgver}
  patch -Np1 -i ../0001-fix-conflicting-path-in-brightness.patch
  cd ${srcdir}
  mkdir -p build
}

build() {
  cd ${pkgname}-v${pkgver}

  qmake-qt5 ${pkgname}.pro
  make
}

package() {
  cd ${pkgname}-v${pkgver}
  make INSTALL_ROOT=${pkgdir} install
}
