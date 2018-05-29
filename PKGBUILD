# Maintainer: David Cristofaro <david@dtcristo.com>
pkgname=lucky-git
pkgver=0.10.0.rc3.r5.gbecb039
pkgrel=1
pkgdesc='A web framework written in Crystal that helps you build apps quickly, catches bugs for you, and runs incredibly fast'
arch=('x86_64')
url='https://luckyframework.org/'
license=('MIT')
depends=('crystal' 'shards')
makedepends=('git')
provides=('lucky')
conflicts=('lucky')
source=('git+https://github.com/luckyframework/lucky_cli.git')
sha256sums=('SKIP')

pkgver() {
  cd lucky_cli
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd lucky_cli
  crystal deps
  crystal build src/lucky.cr --release --no-debug
}

package() {
  cd lucky_cli
  install -Dm755 lucky "$pkgdir/usr/bin/lucky"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
