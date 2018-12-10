# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname=fogtrack
pkgver=0.4.4
pkgrel=1
pkgdesc='A cli tool for all you fogbugz tracking needs'
arch=(x86_64 i686)
url='https://gitlab.com/jreinert/fogtrack'
license=('MIT')
depends=(pcre gc libevent)
optdepends=('rofi: for task switching dialog')
makedepends=(crystal shards)

source=("https://gitlab.com/jreinert/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('1a9385d8ee010c1518d3060cc0746722b18edfd7c1797e9f06a7ce6b23141e8d7ae4820ca78d6ea1d4b2530833306dbd5951b6f1646e4c786dcebf66f8a675b0')
provides=('fogtrack')
conflicts=('fogtrack-git')

build() {
  cd "$pkgname-v${pkgver}"
  shards build --production --release --no-debug --link-flags='-Wl,-sort-common,--as-needed,-z,relro'
}

package() {
  cd "${pkgname}-v${pkgver}"
  install -Dm755 bin/${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
