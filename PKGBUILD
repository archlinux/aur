# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=trurl-git
pkgver=0.9.r16.g1518a4b
pkgrel=1
pkgdesc="Command line tool for URL parsing and manipulation"
arch=('i686' 'x86_64')
url="https://curl.se/trurl/"
license=('MIT')
depends=('glibc' 'curl')
makedepends=('git')
checkdepends=('python')
provides=("trurl=$pkgver")
conflicts=('trurl')
source=("git+https://github.com/curl/trurl.git")
sha256sums=('SKIP')


pkgver() {
  cd "trurl"

  _tag=$(git tag -l --sort -v:refname | grep -E '^trurl-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^trurl-//'
}

build() {
  cd "trurl"

  make
}

check() {
  cd "trurl"

  make test
}

package() {
  cd "trurl"

  make \
    DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/trurl"
}
