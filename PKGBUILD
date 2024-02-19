# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=homebridge
pkgver=1.7.0
pkgrel=1
pkgdesc='HomeKit support for the impatient'
arch=('any')
url='https://github.com/homebridge/homebridge'
license=('Apache')
depends=('nodejs')
makedepends=('npm')
optdepends=('homebridge-config-ui-x: for web-based management tool')
options=('!emptydirs' '!strip')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('d908a45e79a99c57b6b37dd0f13798139fac5f2287519fbd97959f0e6a6eba91dd72de87fc6e9beb3dc70a3fb6ae531128a6391252efe57b4ba3139c69f9cbd2')
b2sums=('9b2c32af7c0317c931950d9b6b060ecb349afbdc486a8220a8fcb9ed43ad290ff93dc9a0b24925f6771b268ef3143b15e0e502d169818310ace337d0ef27ec51')

package() {
  export NPM_FLAGS=(--no-audit --no-fund --no-update-notifier)
  npm install \
    --global \
    --prefix "$pkgdir/usr" \
    "${NPM_FLAGS[@]}" \
    "$pkgname-$pkgver.tgz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  unset NPM_FLAGS
}
