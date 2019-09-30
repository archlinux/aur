# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_pkgname=lifelines
pkgname=python-lifelines
pkgver=0.22.7
pkgrel=1
pkgdesc="Survival analysis in Python"
url="https://github.com/CamDavidsonPilon/lifelines"
arch=('any')
license=('MIT')
depends=('python-autograd-gamma' 'python-matplotlib' 'python-pandas')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/CamDavidsonPilon/lifelines/archive/v${pkgver}.tar.gz")
sha256sums=('77351e10bee82776fd0845e0ae1d8c9f4c1485c69762946e8700f5173b65f83c')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
} 

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Move Files
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  _ver=$(python -c "import platform; print(platform.python_version())")
  mv ${pkgdir}/usr/lib/python${_ver%.*}/site-packages/{LICENSE,README.md,MANIFEST.in} ${pkgdir}/usr/share/doc/${pkgname}
}
