# Maintainer: jakka <jakka@jakka.su>

pkgbase=python-hydrus
pkgname=("python-hydrus")
pkgver=5.1.1
pkgrel=2
_commit=8de3d28bddc6d76d0aeee534a4b7b7c1673824ab
pkgdesc="Python module implementing the Hydrus API."
arch=("any")
url="https://gitlab.com/cryzed/hydrus-api"
license=("AGPLv3")
depends=("python" "python-requests")
makedepends=("python-poetry" "python-requests" "git")
source=("git+https://gitlab.com/cryzed/hydrus-api.git#commit=$_commit")
sha512sums=('a021ddf16f48b477f63ff460831d49a473e22f53cac80b5ff27cd4d28525f36dd41c8a120006c3742da2bf787850e676ac10da60170a0c1ea8a0d8371ac32c7d')

prepare() {
  cd $srcdir/hydrus-api
  python -m poetry install
}

build() {
  cd $srcdir/hydrus-api
  python -m poetry build
}

package_python-hydrus() {
  cd "${srcdir}/hydrus-api"
  python -m installer --destdir $pkgdir $srcdir/hydrus-api/dist/hydrus_api-${pkgver}-py3-none-any.whl
}
