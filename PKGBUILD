# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname='snac'
pkgver='2.31'
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
b2sums=('f03dcb2abdc5a4696914e9cb558ed4a4a2453da2c484e9e96e27d1c1c012d5d5e1e4ab4492c8eb8df347df7f8c1fbb66e23b04e5ac7a253b0c944033d21b350e'
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
