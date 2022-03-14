# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=heif
pkgver=3.6.2
pkgrel=2
pkgdesc='High Efficiency Image File Format'
arch=('x86_64' 'i686')
url='https://nokiatech.github.io/heif/'
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/nokiatech/heif/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "0001-fix-gcc11-includes.patch")
b2sums=('b0cf8bd40b3a7b49173f129b173aebe3e2794d6bcd59c6bd453978ef68da1b68e9c09aa33fc98758ee08c2eab48e6cfa9f323b42301faa60ec87f0462c122848'
        '71f93aac36cae3caf6460691a49d2c036084242b0fbfe7b0ac33f4499c8f901777983bb5d94b3bfb7e116fd13e67252bee9f6249cf2681dfb1bbccea3fa3b982')

build() {
  cd ${pkgname}-${pkgver}/build/
  cmake ../srcs
  make
}

prepare() {
    cd ${pkgname}-${pkgver}
    patch --forward --strip=1 --input="${srcdir}/0001-fix-gcc11-includes.patch"
}

package() {
  cd ${pkgname}-${pkgver}
  install -dm755 "${pkgdir}"/usr/lib/heif/
  install -Dm644 LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}
  cp -r srcs/api "${pkgdir}"/usr/lib/heif/
  cd build/lib/
  install -Dm644 -t "${pkgdir}"/usr/lib/ ./*
}
