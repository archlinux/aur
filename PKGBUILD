# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=rye-bin
pkgver=0.40.0
pkgrel=1
pkgdesc="An experimental alternative to poetry, pip, pipenv, venv, virtualenv, pdm, hatch, …"
arch=('x86_64')
url="https://github.com/mitsuhiko/rye"
license=('MIT')
depends=(
  zlib
  openssl
  glibc
  gcc-libs
  libxcrypt-compat # https://github.com/mitsuhiko/rye/issues/15
)
provides=(rye)
conflicts=(rye)
source=("rye-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("rye-$pkgver-x86_64-linux.gz::$url/releases/download/$pkgver/rye-x86_64-linux.gz")
sha256sums=('cbd50e53bc1e57e5d5d0102775cb1c822695acb5024814be7eeb78e654e046df')
sha256sums_x86_64=('93c34835187659e1a18f636e9440d47bee7c45b8e6aef5fd95ef6099c20d804e')

package() {
  install -Dm755 "rye-$pkgver-x86_64-linux" "$pkgdir/usr/bin/rye"
  install -Dm644 "rye-$pkgver/CHANGELOG.md" -t "$pkgdir/usr/share/doc/rye"
  install -Dm644 "rye-$pkgver/README.md" -t "$pkgdir/usr/share/doc/rye"
  install -Dm644 "rye-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  cd "rye-$pkgver/docs"
  local docs="$pkgdir/usr/share/doc/$pkgname/docs"
  find ./ -type f -type f -name \*.md -exec install -Dm644 "{}" "$docs/{}" \;
}

