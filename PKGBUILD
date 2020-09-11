# Maintainer: Caleb Maclenenan <caleb@alerque.com>
# Contributor: William Turner <willtur.will@gmail.com>

pkgname=python-ufonormalizer-git
_pkgname=ufoNormalizer
pkgver=0.4.2.r1.gd22e855
pkgrel=1
pkgdesc="A tool that will normalize XML and other data inside of a UFO"
url="https://github.com/unified-font-object/$_pkgname"
license=('BSD')
arch=('any')
depends=('python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'python-setuptools-scm')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 HEAD |
      sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
