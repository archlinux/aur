# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=holehe
pkgver=1.61
pkgrel=5

pkgdesc="Check if an email address is used on different sites"
arch=('any')
url="https://github.com/megadose/holehe"
license=('GPL-3.0-only')

depends=(
  python
  python-beautifulsoup4
  python-colorama
  python-httpx
  python-termcolor
  python-tqdm
  python-trio
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

# Hashes updated by updpkgsums
sha256sums=('1a02e7c103b9abcb485eb0aaca36d950ac6bff4ec001d644362cc46739916b3b')

_archive="${pkgname//-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")

build() {
  cd "$srcdir/$_archive"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_archive"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
