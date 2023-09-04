# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Nils Bars <nils@nbars.de>

pkgname=cutecom
pkgver=0.51.0
pkgrel=4
pkgdesc="A graphical serial terminal"
arch=(i686 x86_64 aarch64)
url="https://gitlab.com/cutecom/cutecom"
license=(GPL3)
depends=(qt5-base qt5-serialport)
makedepends=(cmake patch)
source=(${pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/cutecom-v${pkgver}.tar.gz
        fix_qpainterpath.patch
        fix_lrzsz.patch)
sha256sums=('4b2591daa983b31716091bd1602988b5a06a19c1a3402150826fc36233edbedd'
            '9ac6861c60b7e68cc0daa58ff745fffbf5a99214b584d00e54574db41e4e7eca'
            'e171370cd9e0f8ab1627b2456129cea9f3a98d39a518cbf46df4ed1dcca9d2cf')

prepare() {
  cd "${srcdir}/cutecom-v${pkgver}"

  patch -Np0 -i "${srcdir}/fix_qpainterpath.patch"
  patch -Np0 -i "${srcdir}/fix_lrzsz.patch"
}

build() {
  cd "${srcdir}/cutecom-v${pkgver}"

  mkdir build
  cd build

  cmake ..
  make
}

package() {
  cd "${srcdir}/cutecom-v${pkgver}"

  install -Dm644 cutecom.desktop "${pkgdir}/usr/share/applications/cutecom.desktop"
  install -Dm644 images/cutecom.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cutecom.svg"
  install -Dm755 build/cutecom "${pkgdir}/usr/bin/cutecom"
  install -Dm644 cutecom.1 "${pkgdir}/usr/share/man/man1/cutecom.1"
}
