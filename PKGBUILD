# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname='snac'
pkgver='2.47'
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
b2sums=('67103080c0d9097b39b3efbf5491f44f33d525f9b2524075360162fc24e2f94a1dd75920eff7f0dd0b05e4fcbbdfb904e2e03a148ece4659ad2270a263d86221'
        'f2ca53f40c9ea2e82a63c0437272dfbb9636a27b23752253832ed67b2cc7f806a289851339f6505eb265a4b84a02b5fe16c031d40e0aa62446dafe183a61f20d'
        '5378f76bd65ca03b7edc9d3e61156ef027dbf9e1ce7612bed129d37d63fd0a95203db96e246714512a4ed0c363cc60f3d29302c8ef4a7970fd88e05039858da8'
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
