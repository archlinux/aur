# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>

pkgname=numlockl
pkgver=1.0.9
pkgrel=2
pkgdesc='Turns on the numlock key.'
arch=('x86_64')
url='https://gitlab.com/phoepsilonix/numlockl'
license=('MIT')
depends=('glibc')
source=(https://gitlab.com/phoepsilonix/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz
        LICENSE)
sha512sums=('863124f1404ab993782aef5e619ae4f11b3cd538619d488cbc8aa58bfd5f02a1053bd2d1a4f31aaee73d932a9def530ca656b7bb9f600e914d5d50bcffb82a87'
            'c5ac1d5ef4e6b12206d27369087fca7d39cedc2ad3cd625caa5b5c558ab003195a8158ab19206b89e0ccbd4e9c1b39348a72923ba2c35c8d33fc603fae3f4bd8')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  if [[ $CC == "clang" ]];then
    CFLAGS+=" -flto=full -Os"
    LDFLAGS+=" -flto=full -Os"
  fi

  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  make prefix="${pkgdir}/usr" install
  
  # Install the custom MIT license
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
