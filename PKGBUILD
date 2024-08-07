# Maintainer: neolouker <neolouker@gmail.com>
# Contributor: nblock <nblock [/at\] archlinux DOT us>

pkgname=pbincli
_name="PBinCLI"
pkgver=0.3.5
pkgrel=3

pkgdesc='A command line client for PrivateBin'
arch=('any')
url="https://github.com/r4sas/${_name}"
license=('MIT')

depends=('python'
         'python-base58'
         'python-pycryptodome'
         'python-requests'
         'python-sjcl'
         'python-argcomplete'
         'python-pysocks')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

_pkgsrc="${_name}-${pkgver}"
conflicts=(pbincli-git)
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cfd978ff8195f7f586a13095bc2cbbc43d369fd7488d951b32bff6b7cc706be4')

build() {
  cd "${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgsrc}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
