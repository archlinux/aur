# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-pfp
_pkgname=pfp
pkgver=0.4.11
pkgrel=2
pkgdesc='An interpreter for 010 template scripts.'
arch=(any)
url=https://github.com/d0c-s4vage/pfp
license=('MIT')
depends=(python-py010parser python-six python-intervaltree)
makedepends=(python-setuptools)
source=(https://github.com/d0c-s4vage/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=(5b625fae1ad1d12d820da3c207998ed1d7b069f2cc9deae6e8af0dce85c1757c)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  sed -i "s/{{VERSION}}/${pkgver}/g" setup.py
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
  install -d -m 755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
