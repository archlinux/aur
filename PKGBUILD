# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=dcaenc-git
pkgver=3.0.g9b89d76
pkgrel=1
pkgdesc='A Free Software (LGPL-licensed) encoder for the DTS Coherent Acoustics audio format. (GIT version)'
arch=('x86_64')
url='https://gitlab.com/patrakov/dcaenc'
license=('LGPL')
depends=('alsa-lib')
makedepends=('git')
provides=('libdcaenc.so'
          "dcaenc=${pkgver}"
          )
conflicts=('dcaenc')
source=('git+https://gitlab.com/patrakov/dcaenc.git')
sha512sums=('SKIP')

pkgver() {
  cd dcaenc
  echo $(git describe --long --tags | tr - . | tr -d v)
}

build() {
  cd dcaenc

  autoreconf -vfi
  ./configure --prefix=/usr
  make
}

check() {
  cd dcaenc
  make -k check
}

package() {
  cd dcaenc
  make DESTDIR="${pkgdir}/" install
}
