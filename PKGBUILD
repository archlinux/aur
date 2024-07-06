# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

_gituser=pycontribs
_pkgname=jenkinsapi

pkgbase=python-${_pkgname}
pkgname=("python-${_pkgname}")
pkgver=0.3.13
pkgrel=5
pkgdesc="Python API for accessing resources on a Jenkins continuous-integration server"
arch=('any')
url="https://github.com/${_gituser}/${_pkgname}"
license=('MIT')
makedepends=("python-build" "python-flit-core" "python-installer")
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('246a98a63e61f54a15d16105cb15488c5670734df41e86c7af0d5d9c0af240b9')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --no-isolation --wheel
}

package_python-jenkinsapi() {
  depends=("python" "python-urllib3" "python-setuptools" "python-requests" "python-pytz" "python-six")
  optdepends=("python-requests-kerberos: for Kerberos support")

  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
