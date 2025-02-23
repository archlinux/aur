# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-srptools
_pkgname="${pkgname#python-}"
pkgver=1.0.1
pkgrel=2
pkgdesc='Tools to implement Secure Remote Password (SRP) authentication'
arch=('any')
url='https://github.com/idlesign/srptools'
license=('BSD-3-Clause')
depends=('python' 'python-six' 'python-click')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest' 'python-six')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('824ffa8367deb42ae5e41965e9ef804a8ccac6e92bf3e5e890174398c767630a')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
