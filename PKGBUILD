# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=python-librivox-git
pkgver=0.1
pkgrel=1
pkgdesc='Python library for interfacing with LibriVox'
arch=('any')
url='https://codeberg.org/Freso/python-librivox'
license=('AGPL-3.0-or-later')
depends=('python')
makedepends=(
  'python-hatchling'
  'python-hatch-vcs'
  # Generic/Arch Linux
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  python -m hatch version
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  # Remove stale wheels and other build artifacts
  git clean -dfx
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
