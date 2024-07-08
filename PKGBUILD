# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=rye-bin
pkgver=0.36.0
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
sha256sums=('9f369a89e6ee770ab542b00acb2a188dfac105924a9387636ce472d4e8a72c9c')
sha256sums_x86_64=('9be13e1ac28d9ddc602b33ff3e73e9ffd983918538a6195bcdc696a401fa941c')

package() {
  install -Dm755 "rye-$pkgver-x86_64-linux" "$pkgdir/usr/bin/rye"
  install -Dm644 "rye-$pkgver/CHANGELOG.md" -t "$pkgdir/usr/share/doc/rye"
  install -Dm644 "rye-$pkgver/README.md" -t "$pkgdir/usr/share/doc/rye"
  install -Dm644 "rye-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  cd "rye-$pkgver/docs"
  local docs="$pkgdir/usr/share/doc/$pkgname/docs"
  find ./ -type f -type f -name \*.md -exec install -Dm644 "{}" "$docs/{}" \;
}

