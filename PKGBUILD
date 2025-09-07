# Contributor: Martino Pilia <martino.pilia@gmail.com>

_name=pyre_extensions
_py=py3
pkgname=python-pyre_extensions-bin
pkgver=0.0.32
pkgrel=1
pkgdesc="Extensions to the typing module supported by Pyre"
arch=('any')
url="https://pyre-check.org/"
license=('MIT')
depends=(
    'python'
    'python-typing_extensions'
    'python-typing_inspect'
)
provides=('python-pyre_extensions')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('a63ba6883ab02f4b1a9f372ed4eb4a2f4c6f3d74879aa2725186fdfcfe3e5c68')

package() {
_python_version=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  python -m installer --destdir="$pkgdir" ./*.whl
  python -O -m compileall "${pkgdir}/usr/lib/python${_python_version}/site-packages/pyre_extensions"
  install -D -m644 \
    "${pkgdir}/usr/lib/python${_python_version}/site-packages/pyre_extensions-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
