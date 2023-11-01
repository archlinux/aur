# Maintainer: robertfoster
pkgname=flict-git
pkgver=1.1.2.r0.gbca99b7
pkgrel=1
pkgdesc="Open source software license compatibility tool"
arch=('any')
depends=('python' 'python-license-expression' 'python-osadl-matrix')
makedepends=(python-{build,installer,wheel} python-setuptools)
url="https://github.com/vinland-technology/flict"
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
license=('GPL3')
source=("${pkgname%%-git}::git+${url}")

build() {
  cd "${pkgname%%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname%%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

pkgver() {
  cd "${pkgname%%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

sha256sums=('SKIP')
