# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=rye-bin
pkgver=0.32.0
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
sha256sums=('471e6164c1c1515b8ba7e536dfa7ba6054b5fec94a07f54608ea3a01c8408460')
sha256sums_x86_64=('c917daac1bbdda4115838116f548236ed3c603d1aef649e72f0cd8078aa1097a')

package() {
  install -Dm755 "rye-$pkgver-x86_64-linux" "$pkgdir/usr/bin/rye"
  install -Dm644 "rye-$pkgver/CHANGELOG.md" -t "$pkgdir/usr/share/doc/rye"
  install -Dm644 "rye-$pkgver/README.md" -t "$pkgdir/usr/share/doc/rye"
  install -Dm644 "rye-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  cd "rye-$pkgver/docs"
  local docs="$pkgdir/usr/share/doc/$pkgname/docs"
  find ./ -type f -type f -name \*.md -exec install -Dm644 "{}" "$docs/{}" \;
}

