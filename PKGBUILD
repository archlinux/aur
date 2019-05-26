# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_gitcommit=6685e3945edec224c8133fb62f1f347b4f7be07d

pkgname=rst2pdf
pkgver=0.95.dev0+2+${_gitcommit:0:7}
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
  'python-svglib'  # should be optional
)
makedepends=('python-setuptools')
arch=('any')
license=('MIT')
provides=('rst2pdf')
conflicts=('python-rst2pdf' 'python2-rst2pdf')
source=(
  "git+https://github.com/rst2pdf/rst2pdf.git#commit=${_gitcommit}"
  01-fixed-print-compatible-in-python3.patch
)
sha256sums=(
  'SKIP'
  '72ce82472b1e14a28410a30f6aa617d0012a52e2e5612690536acc3d0d7e06e4'
)

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p0 -i ../01-fixed-print-compatible-in-python3.patch
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 CHANGES.rst "${pkgdir}/usr/share/doc/${pkgname}/CHANGES.rst"
  install -Dm644 CODE_OF_CONDUCT.md "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
  install -Dm644 Contributors.txt "${pkgdir}/usr/share/doc/${pkgname}/Contributors.txt"
  install -Dm644 MAINTAINERS.md "${pkgdir}/usr/share/doc/${pkgname}/MAINTAINERS.md"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
