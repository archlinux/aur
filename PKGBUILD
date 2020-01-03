# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgname=python2-cheetah3
_name=Cheetah3
pkgver=3.2.4
pkgrel=2
pkgdesc="A Python powered template engine and code generator"
arch=(any)
url="http://www.cheetahtemplate.org"
license=(MIT)
depends=('python2-setuptools')
optdepends=('python2-markdown')
conflicts=('python2-cheetah')
provides=('python2-cheetah')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('f991865d384cbc7fe287c5d89d9990bfdde205df64f2c9cf8df17427ce865701e4fb2c35e7d52753b40ac170a56b8d071e7ae8bff83cbefe8ec662099fbe1340')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Avoid conflict with python-cheetah3
  for name in cheetah cheetah-analyze cheetah-compile; do
    mv "${pkgdir}/usr/bin/${name}"{,2}
  done
}
