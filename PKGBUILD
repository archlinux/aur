# Maintainer: David Runge <dave@sleepmap.de>
_name=langdetect
pkgbase=python-langdetect
pkgname=('python-langdetect' 'python2-langdetect')
pkgver=1.0.7
pkgrel=3
pkgdesc="Language detection library ported from Google's language-detection"
arch=('any')
url="https://github.com/Mimino666/langdetect"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name}-${pkgver}.zip")
sha512sums=('7740bc8e5ea581bed69de9744a934f3e9c72910175933acb266bf25b0cb8797da6041b3d35e7c5d622a037b4c9e3d264828c2ba31bd2866fa7c36cf189e4767a')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname[0]}-${pkgver}"
  cp -av "${pkgname[0]}-${pkgver}" "${pkgname[1]}-${pkgver}"
}

build() {
  cd "${pkgname[0]}-${pkgver}"
  python setup.py build
  cd ../"${pkgname[1]}-${pkgver}"
  python2 setup.py build
}

package_python-langdetect() {
  depends=('python-six')
  cd "${pkgname[0]}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm644 README.md "${pkgdir}/usr/share/doc/${pkgname[0]}/README.md"
}

package_python2-langdetect() {
  depends=('python2-six')
  cd "${pkgname[1]}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm644 README.md "${pkgdir}/usr/share/doc/${pkgname[1]}/README.md"
}
