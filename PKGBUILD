# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>

pkgname=numlockl
pkgver=1.0.1
pkgrel=5
pkgdesc='Turns on the numlock key.'
arch=('x86_64')
url='https://github.com/phoepsilonix/numlockl'
license=('MIT')
depends=('libbsd')
source=(https://gitlab.com/phoepsilonix/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz
        LICENSE)
sha512sums=('bb29ed659287011c023b852d0e873e1d48eae598307bedb9f0509f3ac99828784c23e355b224c2634756d80b5b20153b3ea2dfc213bd6626c421ea00b3c45c85'
            'c5ac1d5ef4e6b12206d27369087fca7d39cedc2ad3cd625caa5b5c558ab003195a8158ab19206b89e0ccbd4e9c1b39348a72923ba2c35c8d33fc603fae3f4bd8')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  if [[ $CC == "clang" ]];then
    CFLAGS+=" -flto"
    LDFLAGS+=" -flto -fuse-ld=lld"
  fi

  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  mkdir -p ${pkgdir}/usr/bin
  make prefix="${pkgdir}/usr" install
  
  # Install the custom MIT license
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
