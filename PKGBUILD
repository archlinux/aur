# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=bandcamp-dl-git
pkgver=v0.0.13.r38.gd454199
pkgrel=1
pkgdesc="Download audio from bandcamp.com"
arch=('any')
url="https://github.com/iheanyi/bandcamp-dl"
license=('Unlicense')
makedepends=('git' 'python-build' 'python-installer')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-chardet'
  'python-demjson3'
  'python-docopt'
  'python-mock'
  'python-mutagen'
  'python-requests'
  'python-unicode-slugify'
  'python-setuptools'
)
provides=("${pkgname/-git/}")
conflicts=("${pkgname/-git/}")
options=(!emptydirs)
source=("git+https://github.com/iheanyi/bandcamp-dl.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname/-git/}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname/-git/}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 643 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
