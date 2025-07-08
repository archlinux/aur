# Maintainer: Dmitry <dimflix.official@gmail.com>
pkgname=pawlette
conflicts=('pawlette-git')
provides=('pawlette-git')
pkgver=0.0.3
pkgrel=1
pkgdesc="😺 Utility for changing themes in the meowrch (stable)"
arch=('any')
url="https://github.com/meowrch/pawlette"
license=('GPL-3.0')
depends=('python')
makedepends=('python-uv' 'python-virtualenv' 'git')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e4e0d331b1161d98dad6377e30ab52530f2ef3dacbbaf8800b9112688ee38a67')

package() {
  cd "$srcdir/pawlette-$pkgver"

  # Install virtual environment
  install -d -m755 "$pkgdir/opt/$pkgname"
  python -m venv "$pkgdir/opt/$pkgname/.venv"
  uv sync --no-dev --frozen --compile-bytecode

  # Install application files
  cp -r . "$pkgdir/opt/$pkgname/"

  # Create launch script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pawlette" << EOF
#!/bin/sh
cd /opt/pawlette
exec .venv/bin/python run.py "\$@"
EOF
}