# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=python-ghdiff-git
pkgver=r60.fa5ec34
pkgrel=1
pkgdesc="Generate Github-style HTML for unified diffs."
arch=('any')
url="https://github.com/kilink/ghdiff"
license=('MIT')
depends=('python')
makedepends=('python-distribute' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!emptydirs)
source=("${pkgname%-git}::git+https://github.com/kilink/ghdiff")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
