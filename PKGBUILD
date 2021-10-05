# Maintainer: Antoine POPINEAU <antoine at popineau dot eu>

pkgname=greetd-tuigreet-bin
pkgver=0.7.1
pkgrel=1

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
sha256sums=('b8a754b455b3ae9fbad33a5b27213138137bb03844e4d1cdda927d449969db08'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '931bbff0764f7a4031b20b73b3d6b801c4be3dd6a5500cc4c7a001ffca0f02dc'
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
