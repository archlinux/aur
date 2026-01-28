# Maintainer: JP Cimalando <jp-dev@inbox.ru>
# Maintainer: taotieren <admin@taotieren.com>

_name=macholib
pkgbase=python-macholib
pkgname=python-macholib
pkgver=1.16.4
pkgrel=4
pkgdesc="Mach-O header analysis and editing"
arch=('any')
url="https://github.com/ronaldoussoren/macholib"
license=('MIT')
depends=('python' 'python-altgraph')
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
)
source=("${pkgname}::git+${url}.git#tag=v$pkgver")
sha512sums=('36d656c5e0e10a9b421789ef841619bbb9d16261c52c23f826f9efd2500b6f4d677a7b9ed47a5ea2bdd3d9ed1da6ef43f02c889593ac077e2810aaeea864e843')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}
