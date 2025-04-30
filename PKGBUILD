# Maintainer: Benjamin Hammond <benjaminphammond@gmail.com>
pkgname=org
pkgver=0.0.18
pkgrel=1
pkgdesc="Suckless second brain"
arch=('any')
url="https://github.com/benjaminingreens/org"
license=('MIT')
depends=('python')  # No need to list pip-only dependencies
makedepends=('git')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')  # Since it's a Git source, we skip the checksum

prepare() {
  cd "$srcdir/$pkgname"

  # Remove install_requires from setup.py to prevent automatic pip installs
  sed -i '/install_requires=\[/,/\],/d' setup.py
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
  install -Dm644 requirements.txt "$pkgdir/usr/share/org/requirements.txt"
}
