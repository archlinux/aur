# Maintainer: George Dietrich <george@dietrich.app>
pkgname=oq
pkgver=1.3.0
pkgrel=1
pkgdesc='A performant, and portable jq wrapper to facilitate the consumption and output of formats other than JSON; using jq filters to transform the data.'
arch=('i686' 'x86_64')
url='https://github.com/blacksmoke16/oq'
license=('MIT')
depends=('jq' 'libyaml' 'libxml2' 'libevent' 'gc' 'pcre')
makedepends=('crystal' 'shards')
checkdepends=('jq' 'crystal')
source=("$pkgname-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('5bfb23b0c527f45eacd40485779c708b1a05dd36015b50b84df29c2ac3f6cdac')

build() {
  cd "$pkgname-$pkgver"
  shards build --release --no-debug --production --link-flags="-Wl,-z,relro,-z,now"
}

check() {
  cd "$pkgname-$pkgver"
  bin/oq -V
  crystal spec --order random
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/oq "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
