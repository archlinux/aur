# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pyproject-parser
pkgver=0.13.0
pkgrel=1
pkgdesc='Parser for pyproject.toml'
arch=(any)
url='https://github.com/repo-helper/pyproject-parser'
license=(MIT)
depends=(
  python
  python-apeye-core
  python-attrs
  python-dom-toml
  python-domdf-python-tools
  python-natsort
  python-packaging
  python-shippinglabel
  python-toml
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-requirements-txt
  python-setuptools
  python-wheel
)
#checkdepends=()
# cli optdepends: click, consolekit & sdjson
optdepends=(
  'python-readme-renderer: render markdown'
  'python-cmarkgfm: render markdown'
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('35d5f6544728c11da35e7405f9dbf582a18bc113f46ca91e7aa90902673d87b1756c8ab5d86e77cbfb30b40066b223927913aa3427f01180c5a0dbfa16e6bc4f')
b2sums=('28f7fffcaea44c3109b340caa16042e9a5cbe82eb629eacad626f5a75236545486795118b8ba36a07ad4aa0c5bbc007006bc9cfab0e9ff57689b0ef62591c3b9')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
