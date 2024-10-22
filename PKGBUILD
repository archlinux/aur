# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=rye-bin
pkgver=0.42.0
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
sha256sums=('71b61b8ef6b2aa1c9633b18e72d2f2b06fd3f47264cf276bc7f65e4ec0b1c7af')
sha256sums_x86_64=('1233f41f951d1122c1ffed3dbe7b0b101793ddf0d3df635adcf7bd757ac7ccbc')

package() {
  install -Dm755 "rye-$pkgver-x86_64-linux" "$pkgdir/usr/bin/rye"
  install -Dm644 "rye-$pkgver/CHANGELOG.md" -t "$pkgdir/usr/share/doc/rye"
  install -Dm644 "rye-$pkgver/README.md" -t "$pkgdir/usr/share/doc/rye"
  install -Dm644 "rye-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  cd "rye-$pkgver/docs"
  local docs="$pkgdir/usr/share/doc/$pkgname/docs"
  find ./ -type f -type f -name \*.md -exec install -Dm644 "{}" "$docs/{}" \;
}

