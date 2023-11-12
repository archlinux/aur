# Maintainer: Gesh <gesh@gesh.uni.cx>
pkgname=python-papis-scihub-git
_plugname="${pkgname%-git}"
_plugname="${_plugname#python-}"
pkgver=1.4.0
pkgrel=1
pkgdesc="Papis plugin to import from Sci-Hub"
arch=('any')
url="https://github.com/raj-magesh/papis-scripts/papis-scihub"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname::git+${url%/$_plugname}.git" fix-build-lint.patch)
sha256sums=('SKIP'
            '00f6a2efe1c8459ce6d19a71cf2d77313137637811998263ce98849834f80bbf')

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  git -C "${srcdir}/${pkgname}" apply "${srcdir}/fix-build-lint.patch"
}

build() {
  cd "${srcdir}/${pkgname}/${_plugname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}/${_plugname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
