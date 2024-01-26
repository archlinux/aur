# Maintainer: James Morris <james at jwm hyphen art dot net>
# Contributor: André <andre-arch at delorus dot de>
pkgname=fittotcx-git
pkgver=r38.afc81ca
pkgrel=1
pkgdesc="Converts a Garmin FIT file into TCX format outputting the result to standard output."
arch=('any')
url="https://github.com/Tigge/FIT-to-TCX"
license=('MIT')
depends=('python-lxml' 'python-fitparse-git')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
source=("${pkgname%-git}"::git+https://github.com/Tigge/FIT-to-TCX)
md5sums=('SKIP')

pkgver(){
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package(){
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENCE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

