# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-la_panic
_pkgname="${pkgname#python-}"
pkgver=0.5.0
pkgrel=1
pkgdesc='A tool for working with iPhone crash reports'
arch=('any')
url='https://gitlab.com/yanivhasbanidev/la_panic'
license=('GPL3')
depends=('python' 'python-setuptools' 'python-click' 'python-coloredlogs' 'python-cached-property')
makedepends=('git' 'python-build' 'python-wheel' 'python-installer')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}::git+${url}.git#tag=${pkgver}")
sha256sums=('745798422e4541171cd20220d2afbd5443408a2f9699003fec717f1157c3cd21')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
