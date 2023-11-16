# Maintainer: robertfoster
pkgname=soundcloud-dl-git
pkgver=v2.7.3.r0.g4276511
pkgrel=1
pkgdesc="Souncloud music downloader"
url="https://github.com/flyingrub/scdl"
arch=(any)
depends=(
  'python-clint'
  'python-docopt'
  'python-mutagen'
  'python-pathvalidate'
  'python-requests'
  'python-simplejson'
  'python-soundcloud-v2'
  'python-termcolor'
)
makedepends=(git python-{build,installer,wheel} python-setuptools)
source=("$pkgname::git+https://github.com/flyingrub/scdl.git")
license=(GPL2)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
sha256sums=('SKIP')
