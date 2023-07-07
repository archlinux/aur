# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname='snac'
pkgver='2.36'
pkgrel='1'
pkgdesc="A simple, minimalistic ActivityPub instance"
url="https://codeberg.org/grunfink/${pkgname}2"
license=('MIT')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('libcurl.so')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/grunfink/${pkgname}2/archive/${pkgver}.tar.gz"
        "${pkgname}.install"
        "${pkgname}-system.service"
        "${pkgname}-user.service")
b2sums=('1d474dffec537ad59a246c0b244dee0cf0574ba9e77ff03622e949d7627aff7d4db7dc56c164fe071c49e34b0b2bc752aa61f6f708493b3308d2c4d2e59b5f6d'
        'f2ca53f40c9ea2e82a63c0437272dfbb9636a27b23752253832ed67b2cc7f806a289851339f6505eb265a4b84a02b5fe16c031d40e0aa62446dafe183a61f20d'
        '133a3af9e28ed097c373336fb68876ceb1d75dc2515b590c5ac30930ac0d7e3ede7a3b297923577d69380f4c19f013b68b6cc87a6979e0613fe617fbafa20959'
        '7a34944bb8f001a194123a0fee5ce3077c29e15059e1e558465641dad57dcbf685c6a1a8c913d372b2af2fbddd7d6dbc48cbafdfac3b24aa038ecbbf1e513465')

build() {
  cd "${pkgname}2"
  make
}

package() {
  # services
  install -D -m644 ${pkgname}-system.service \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m644 ${pkgname}-user.service \
    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
  # package
  cd "${pkgname}2"
  make PREFIX="${pkgdir}/usr" PREFIX_MAN="${pkgdir}/usr/share/man" install
  # license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
