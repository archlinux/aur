# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

#_name=rst2pdf

pkgname=rst2pdf
pkgver=0.96
pkgrel=1
pkgdesc="Convert reStructured Text to PDF via ReportLab."
url="https://rst2pdf.org"
depends=(
  'python'
  'python-docutils'
  'python-jinja'
  'python-pdfrw'
  'python-pygments'
  'python-reportlab'
  'python-six'
  'python-smartypants'
)
makedepends=('python-setuptools')
optdepends=(
  'python-sphinx: sphinx'
  'python-wordaxe>=1.0: hyphenation'
  'python-svglib: SVG support'
  'python-aafigure: aafigure support'
  'python-matplotlib: math support'
  'python-xhtml2pdf: raw HTML support'
)
arch=('any')
license=('MIT')
provides=('rst2pdf')
conflicts=('python-rst2pdf' 'python2-rst2pdf')
source=(
  #"git+https://github.com/rst2pdf/rst2pdf.git#tag=${pkgver}"
  #"https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz::https://github.com/rst2pdf/rst2pdf/archive/${pkgver}.tar.gz"
)
sha256sums=(
  #'SKIP'
  #'69ce86b8cfad8da366e0c52caccd9d1aa617e69ca5c3a50feb5519e829d198c4'
  'b54fe6e6bd11211849e3f35c08954804378312005c328dd8185ea52e59829121'
)

build() {
  #cd "${srcdir}/${pkgname}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  #cd "${srcdir}/${pkgname}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 CHANGES.rst "${pkgdir}/usr/share/doc/${pkgname}/CHANGES.rst"
  install -Dm644 CODE_OF_CONDUCT.rst "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.rst"
  install -Dm644 Contributors.txt "${pkgdir}/usr/share/doc/${pkgname}/Contributors.txt"
  install -Dm644 MAINTAINERS.rst "${pkgdir}/usr/share/doc/${pkgname}/MAINTAINERS.rst"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
