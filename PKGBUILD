# Maintainer: Antoine POPINEAU <antoine at popineau dot eu>

pkgname=greetd-tuigreet-bin
pkgver=0.8.0
pkgrel=0

pkgdesc='A console UI greeter for greetd'
url='https://github.com/apognu/tuigreet'
license=(GPL3)
conflicts=(greetd-tuigreet greetd-tuigreet-git)

arch=(x86_64)
makedepends=(scdoc)

source=("https://github.com/apognu/tuigreet/releases/download/${pkgver}/tuigreet-${pkgver}-${CARCH}"
        "https://raw.githubusercontent.com/apognu/tuigreet/${pkgver}/LICENSE"
        "https://raw.githubusercontent.com/apognu/tuigreet/${pkgver}/contrib/man/tuigreet-1.scd"
        'tuigreet.conf')
sha256sums=('5120ec9a17317add4629194d2fbaeafb5422259be3a8fdbb8b626db4ce2abb5e'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '20e3983f6e2cd8138f8d92ddfe2297d3f28c166a8fec6ceb6e57e04da3fc0f92'
            '8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3')

build() {
  scdoc < tuigreet-1.scd > tuigreet-1.roff
}

package() {
  depends=(gcc-libs)

  install -Dm755 "${srcdir}/tuigreet-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tuigreet"
  install -Dm755 "${srcdir}/tuigreet-1.roff" "${pkgdir}/usr/share/man/man1/tuigreet.1"
  install -Dm755 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/tuigreet/LICENSE"

  install -Dm644 "${srcdir}/tuigreet.conf" "${pkgdir}/usr/lib/tmpfiles.d/tuigreet.conf"
}
