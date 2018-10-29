# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname=fogtrack
pkgver=0.4.0
pkgrel=1
pkgdesc='A cli tool for all you fogbugz tracking needs'
arch=(x86_64 i686)
url='https://gitlab.com/jreinert/fogtrack'
license=('MIT')
depends=(pcre gc libevent)
optdepends=('rofi: for task switching dialog')
makedepends=(crystal shards)

source=("https://gitlab.com/jreinert/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('053951a264d10320b4fd0cf16160384603851cd2dd59fcb01115e349dc3261ee0bfe45e25332c73faa6c95a347a5f7c8b8679c036342978f4e95dd031463a868')
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
