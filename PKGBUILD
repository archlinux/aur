# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=nexfil
pkgver=1.0.5
_commit_hash=1a020d4403a531720d3516a65cafd573205c27a8
pkgrel=1
pkgdesc="OSINT tool for finding profiles by username"
arch=(any)
url="https://github.com/thewhiteh4t/nexfil"
license=(MIT)
depends=(
  python-aiohttp
  python-tldextract
  python-requests
  python-packaging
  python-undetected-chromedriver
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/${_commit_hash}.tar.gz"
  "nexfil.sh"
)
sha256sums=(
  'f42ad4c64beb698844c1f3209081020188d1707aa09e28e5b3c9bdd3973eebd6'
  '6841614614f6e46c8037ac360d38448c676da6733fea52b0e3bcd0b8538ffa29'
)

_archive="$pkgname-$_commit_hash"

build() {
  cd "$_archive"

  find . -name '*.py' | xargs python -m py_compile
}

package() {
  cd "$_archive"

  install -dm755 "$pkgdir/opt/nexfil/"
  cp -ar modules/ "$pkgdir/opt/nexfil/"
  cp -ar __pycache__/ "$pkgdir/opt/nexfil/"
  install -Dm644 nexfil.py "$pkgdir/opt/nexfil/nexfil.py"

  install -Dm 755 "$srcdir/nexfil.sh" "$pkgdir/usr/bin/nexfil"

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
