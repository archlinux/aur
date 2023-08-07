# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=nexfil
pkgver=1.0.5
_commit_hash=1a020d4403a531720d3516a65cafd573205c27a8
pkgrel=3
pkgdesc="OSINT tool for finding profiles by username"
arch=(any)
url="https://github.com/thewhiteh4t/nexfil"
license=(MIT)
depends=(
  python
  python-aiohttp
  python-packaging
  python-requests
  python-tldextract
  python-undetected-chromedriver
)
makedepends=(
  findutils
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/${_commit_hash}.tar.gz"
  "nexfil.sh"
)
sha256sums=(
  'f42ad4c64beb698844c1f3209081020188d1707aa09e28e5b3c9bdd3973eebd6'
  'b4245b7ed64f01bd834cac8c5c5525e09a4ff23390c810f7b3b0891ff8f53acd'
)

_archive="$pkgname-$_commit_hash"

build() {
  cd "$_archive"

  find . -name '*.py' -print0 | xargs -0 python -m py_compile
}

package() {
  cd "$_archive"

  install -dm755 "$pkgdir/opt/nexfil/"
  cp -ar modules/ "$pkgdir/opt/nexfil/"
  cp -ar __pycache__/ "$pkgdir/opt/nexfil/"
  install -Dm644 nexfil.py "$pkgdir/opt/nexfil/nexfil.py"

  install -Dm644 metadata.json "$pkgdir/opt/nexfil/metadata.json"
  install -Dm644 url_store.json "$pkgdir/opt/nexfil/url_store.json"

  install -Dm 755 "$srcdir/nexfil.sh" "$pkgdir/usr/bin/nexfil"

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
