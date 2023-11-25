# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=plex-remote
pkgver=1.0.2+5+gc29ef95
pkgrel=1
pkgdesc="A library for easy implementing a remote plex client"
arch=('any')
url="https://github.com/tijder/plex-remote"
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
_commit=c29ef9549c166902e53b3a1b603b365d70ebdf93  # master
source=("git+https://github.com/tijder/plex-remote.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
