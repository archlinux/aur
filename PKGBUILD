# Maintainer: George Dietrich <george@dietrich.app>
pkgname=oq
pkgver=1.3.1
pkgrel=1
pkgdesc='A performant, and portable jq wrapper to facilitate the consumption and output of formats other than JSON; using jq filters to transform the data.'
arch=('i686' 'x86_64')
url='https://github.com/blacksmoke16/oq'
license=('MIT')
depends=('jq' 'libyaml' 'libxml2' 'libevent' 'gc' 'pcre')
makedepends=('crystal' 'shards')
checkdepends=('jq' 'crystal')
source=("$pkgname-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('a926c362a1c1aa3c50b5871b93a387f59166053f3ab611a373a9e9e44300be7f')

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
