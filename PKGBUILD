# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=exam-terminal
pkgdesc="Terminal/console based exam, test, or quiz tool for educators and learners"
pkgver=0.2.13
pkgrel=1
arch=(any)
url="https://github.com/ismet55555/${pkgname}"
license=(Apache-2.0)
depends=(python-fpdf2 python-requests python-yaml python-click)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname//-/_}-${pkgver}.tar.gz
  https://raw.githubusercontent.com/ismet55555/${pkgname}/master/requirements.txt)
sha512sums=('6d3d96963f420b66ee2d7bdf3686ebeb278817f83871338eec7ee3bcf60ad0e27a082f93e2b81f8dc4e8015f7ff7d5ed7772c8ee98bda7948cd4b84b662bfd4f'
            '528394dc6c5d63366d5168920e14c7f9be6d9f413e062829be25a3da07093f7334e27bcb8e1cfc213a889f9fd2d684abdc414bd6a41c48334f850df8068169cd')

prepare() {
  mv requirements.txt ${pkgname//-/_}-${pkgver}
}

build() {
  cd ${pkgname//-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname//-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

}
