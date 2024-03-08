# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>

_pkgname='plakativ'
pkgname="$_pkgname-git"
pkgver=0.5.2.r0.ge84aa8d
pkgrel=2
pkgdesc='Stretch a PDF document or raster image across multiple pages that can then be printed.'
arch=('any')
url="https://gitlab.mister-muffin.de/josch/plakativ"
license=('GPL-3.0-or-later')
depends=(
  'python-pymupdf'
  'img2pdf'
)
makedepends=(
  'git'
  'python-setuptools'
)
source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')
provides=("$_pkgname")
conflicts=(${provides[@]})

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  install -vDm0644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
