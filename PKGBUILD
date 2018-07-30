# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>

pkgname=python-cheetah3
_name=Cheetah3
pkgver=3.1.0
pkgrel=3
pkgdesc="A Python 3-powered template engine and code generator"
arch=(x86_64)
url="http://www.cheetahtemplate.org"
license=(custom)
depends=('python')
optdepends=('python-markdown')
provides=('cheetah3' 'python-cheetah3')
conflicts=('cheetah3' 'python-cheetah3')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('879de1b7a333def757a1618b7c28348d8b2f43a433aa8d5d9ee501619a854c514ca4a842f741bf4d272f5cc2defa137b741d2cc9648a3fc40dc2c4ab50692fac')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  msg "Install..."
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  msg2 "Install copyright resources in /usr/share/licenses/${pkgname}..."
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
