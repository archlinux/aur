# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=result
pkgname="python-${_pkgname}"
pkgver=0.10.0
pkgrel=1
pkgdesc="A rust-like result type for Python"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname//-/_}/${_pkgname//-/_}-${pkgver}.tar.gz")
sha256sums=('28bc217336c2f1d339b494241ccf3714e36e6bd90abc04df318d65dccb61594f')
b2sums=('d53ea34c72ae5f1b5e8dcb83d6be2baa7e859e7bb9e56514f12d7d2cebd7e87249b40dba85b8aa08781bf10927dfa5d2f4e29978fce39158df5ca0876ae3ff5b')

build() {
  cd "${_pkgname//-/_}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname//-/_}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
