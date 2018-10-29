# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname=fogtrack
pkgver=0.3.0
pkgrel=1
pkgdesc='A cli tool for all you fogbugz tracking needs'
arch=(x86_64 i686)
url='https://gitlab.com/jreinert/fogtrack'
license=('MIT')
depends=(pcre gc libevent)
optdepends=('rofi: for task switching dialog')
makedepends=(crystal)

source=("https://gitlab.com/jreinert/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('a9e02df4445e4daf630d2e649a51b812d8a720ffb53d458404cc64283c0942511c3cb70815a74aefef39d785ac0e6a6e3f8277a337fa0b28b7c48f3a5ed10c6e')
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
