# Maintainer: Antoine POPINEAU <antoine at popineau dot eu>

pkgname=greetd-tuigreet
pkgver=0.6.1
pkgrel=1

pkgdesc='A console UI greeter for greetd'
url='https://github.com/apognu/tuigreet'
license=(GPL3)
conflicts=(greetd-tuigreet-bin greetd-tuigreet-git)

arch=(x86_64)
makedepends=(rust scdoc)

source=("${url}/archive/${pkgver}.tar.gz"
        'tuigreet.conf')
sha256sums=('01a89fcc86ff7bb1c287f7faa9f543d3a8631b977d55de6a808805911da0341b'
            '8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3')

build() {
  cd "tuigreet-${pkgver}"

  cargo build --release
  scdoc < contrib/man/tuigreet-1.scd > contrib/man/tuigreet-1.roff
}

package() {
  install -Dm755 "${srcdir}/tuigreet-${pkgver}/target/release/tuigreet" "${pkgdir}/usr/bin/tuigreet"
  install -Dm755 "${srcdir}/tuigreet-${pkgver}/contrib/man/tuigreet-1.roff" "${pkgdir}/usr/share/man/man1/tuigreet.1"
  install -Dm644 "${srcdir}/tuigreet-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/tuigreet/LICENSE"

  install -Dm644 "${srcdir}/tuigreet.conf" "${pkgdir}/usr/lib/tmpfiles.d/tuigreet.conf"
}
