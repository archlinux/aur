# Maintainer: robertfoster
pkgname=flict-git
pkgver=1.3.0.r7.gc65aedd
pkgrel=1
pkgdesc="Open source software license compatibility tool"
arch=('any')
depends=('python' 'python-license-expression' 'python-osadl-matrix')
makedepends=(python-{build,installer,wheel} python-setuptools)
url="https://github.com/vinland-technology/flict"
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
license=('GPL-3.0-or-later')
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
