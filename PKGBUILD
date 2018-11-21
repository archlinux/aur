# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=saws
pkgver=0.1.0
_commit=312ccc1698cf
pkgrel=1
pkgdesc="Scientific Application Web server"
url="https://bitbucket.org/saws/saws/wiki/Home"
arch=('x86_64' 'i686')
license=('MIT')
source=(
  "https://bitbucket.org/saws/saws/get/v${pkgver}.tar.gz"
  'tabs.patch'
)
makedepends=()
depends=()
md5sums=('941a541bdf625856be18c9752249146d'
         'aad46c722f9ab1ce5f73bf0b70c87be3')

prepare() {
  cd ${srcdir}/saws-${pkgname}-${_commit}
  patch -p0 < ../tabs.patch
}

build() {
  cd ${srcdir}/saws-${pkgname}-${_commit}
  ./configure \
    --prefix=/usr \
    --enable-shared
  make
}

package() {
  cd ${srcdir}/saws-${pkgname}-${_commit}
  make DESTDIR=${pkgdir} install
}
