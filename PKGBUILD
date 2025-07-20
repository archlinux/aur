# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=plex-remote
pkgver=1.0.2+5+gc29ef95
pkgrel=2
pkgdesc="A library for easy implementing a remote plex client"
arch=('any')
url="https://github.com/tijder/plex-remote"
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
_commit=c29ef9549c166902e53b3a1b603b365d70ebdf93  # master
source=("git+https://github.com/tijder/plex-remote.git#commit=${_commit}")
sha256sums=('3e15b001afe3a09257bb1e46b54cd834aca4def08bd369cc03d9a50b5c9bb6ec')

pkgver() {
  cd "$pkgname"
  git describe --tags --abbrev=7 | sed 's/^v//;s/-/+/g'
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
