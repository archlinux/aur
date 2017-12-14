# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=coinmon
pkgver=0.0.9
pkgrel=1
pkgdesc='Cryptocurrency price monitoring tool'
arch=('any')
url=https://github.com/bichenkk/coinmon
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("coinmon-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$url/commit/670b474d73961c4862b4ed31e6eb31632e48e57d.patch")
noextract=("${source[1]%%::*}"
           '670b474d73961c4862b4ed31e6eb31632e48e57d.patch')
sha512sums=('ee055b42f126fa95fcb3cb57964ca545c7e505dd04fdebdc9f26946b70d3c79b2000d7c95d6c5c23fb043fb9cd97a358ed180ff3c4a52a9e166205b80b98ceb0'
            '250bace26c3da45eb329250261b5212f4e40cacbcc79b4b7c36b3b7cac06172d72e22f049e349d4fcb4b63450152bc4d240c8312d1f887eaf47eb6f0e0bbb670')

prepare() {
  cd coinmon-$pkgver
  patch -p1 -i ../670b474d73961c4862b4ed31e6eb31632e48e57d.patch
}

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production coinmon-$pkgver.tar.gz

  cd "$pkgdir"
  mkdir -p usr/share/licenses/coinmon
  mv usr/lib/node_modules/coinmon/LICENSE usr/share/licenses/coinmon/
  rmdir usr/etc
  rm usr/lib/node_modules/coinmon/{.,}* | true
}

# vim:set ts=2 sw=2 et:
