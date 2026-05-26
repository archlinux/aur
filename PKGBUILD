pkgname=python-supercode-cli-git
pkgver=0.1.0.r2.gc136c02
pkgrel=1
pkgdesc="Experimental AI hole-filling compiler/interpreter frontend"
arch=('any')
url="https://github.com/LwhJesse/SuperCode"
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}::git+https://github.com/LwhJesse/SuperCode.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags --always 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
