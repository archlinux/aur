# Maintainer: Dmitry <dimflix.official@gmail.com>
pkgname=pawlette
conflicts=('pawlette-git')
provides=('pawlette-git')
pkgver=0.0.2
pkgrel=1
pkgdesc="😺 Utility for changing themes in the meowrch (stable)"
arch=('any')
url="https://github.com/meowrch/pawlette"
license=('GPL-3.0')
depends=('python')
makedepends=('python-uv' 'python-virtualenv' 'git')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7407ea0aba4fcfe306fe910b6221cb595b03551a18a1aaf58349dc639ef13bf6')

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