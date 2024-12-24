# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=probableparsing
pkgname=python-${_base}
_commit=5e3e96b13b294a08406d3dea9a29991401733ece
pkgver=0.0.1.r3.g5e3e96
_pkgver="${pkgver%.r*}"
pkgrel=2
pkgdesc="Common methods for probable parsers"
arch=('any')
url="https://github.com/datamade/${_base}"
license=(MIT)
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('8d696bd4b03ea7d782fa7a12df4b37ad5bc2aaa80abd2a89c64d612b02becb5dd801aa8846e5adb0ffc1d340b9da3aef297aba8fcd922967ef99ac92c56e4a45')

build() {
  cd "${_base}-${_commit}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${_commit}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
