# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname=fogtrack
pkgver=0.4.5
pkgrel=1
pkgdesc='A cli tool for all you fogbugz tracking needs'
arch=(x86_64 i686)
url='https://gitlab.com/jreinert/fogtrack'
license=('MIT')
depends=(pcre gc libevent)
optdepends=('rofi: for task switching dialog')
makedepends=(crystal shards)

source=("https://gitlab.com/jreinert/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('a40999c73f1472fdc89f739ba2371cbe7e9ac4f590ccf295f55bd977bd8a6d4cdcfa190c2009572e01d14a9d3a7b5997736bd4359a14c7d8a624a77dea4fd86c')
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
