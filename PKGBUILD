# Maintainer: Lukas Wölfer (domain is thasky) <aur at [domain] dot one>
pkgname=python-backupcrawl-git
pkgver=0.1.0.r2.g420a304
pkgrel=1
pkgdesc='Crawls through the given directory, and checks which directories are not version controlled.'
url='https://github.com/corrodedHash/backupcrawl'
source=("${pkgname}::git+https://github.com/corrodedHash/backupcrawl#branch=main")
arch=('x86_64' 'i686')
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
depends=('git' 'pacman' 'python')
optdepends=()

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# prepare() {
#   cd "$srcdir/$pkgname"
# }

build () {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  # cd "$srcdir/$pkgname"
  echo No tests
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
