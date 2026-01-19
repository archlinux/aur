# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=python-rst2ansi
_pkgname=rst2ansi
pkgver=0.1.5+r4+g3728e16
pkgrel=1
pkgdesc='Render RST (reStructuredText) to ANSI strings suitable for display in a terminal'
arch=(any)
url='https://github.com/Snaipe/python-rst2ansi'
license=('MIT')
depends=(
  'python'
  'python-docutils'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
# Pick essential fixes since 0.1.5:
# 3728e16 Fix buffer overflow in TIOCGWINSZ ioctl call for Python 3.14+
# 81758ed Fix issue #16 [DeprecationWarning: The docutils.utils.error_reporting module is deprecated and will be removed]
# c6f390b api: fix AttributeError on decode when feeding unicode strings in python3
# 1b1b963 Fix name error
_commit=3728e16f8b8b1dc338e5df90ba2c4a93ee054b3f
source=("git+https://github.com/Snaipe/python-rst2ansi.git#commit=${_commit}")
sha256sums=('c1c6a2f404bf0eea8f2c952f4302aea89ad193bbf8b9f4399d51c45856091296')

pkgver() {
  cd python-rst2ansi
  git describe --long --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd python-rst2ansi
  python -m build --wheel --no-isolation
}

package() {
  cd python-rst2ansi
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
