# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname=fogtrack
pkgver=0.4.2
pkgrel=1
pkgdesc='A cli tool for all you fogbugz tracking needs'
arch=(x86_64 i686)
url='https://gitlab.com/jreinert/fogtrack'
license=('MIT')
depends=(pcre gc libevent)
optdepends=('rofi: for task switching dialog')
makedepends=(crystal shards)

source=("https://gitlab.com/jreinert/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('0921af2cca22be018b54923d464c9ef84b5257f92ba09f4d8db9154e3a88d84146964a08b2312d464413ca8637377eec268b472b4660560eea4b6356435536a5')
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
