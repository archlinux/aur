# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=python2-rst2pdf
_pkgbase="${pkgname#python2-}"
pkgver=0.94
pkgrel=1
pkgdesc='Convert restructured text to PDF via reportlab.'
arch=('any')
url="https://github.com/${_pkgbase}/${_pkgbase}"
license=('MIT')
conflicts=("python-${_pkgbase}")
depends=('python2-docutils' 'python2-reportlab>=2.4' 'python2-pygments' 'python2-pdfrw' 'python2-smartypants' 'python2-jinja' 'python2-pypdf2')
makedepends=('python2-setuptools')
source=("https://github.com/${_pkgbase}/${_pkgbase}/archive/${pkgver}.tar.gz")
sha512sums=('7f99dfab63b4a3074841bdc5de5487298203ab9c6db69af11535662c76277bf45df45a2e583b556a209584b8fdaa647920614a9000985887a111e38769a677c5')

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  # fix python interpreter
  sed -i 's|#!/usr/bin/env python$|#!/usr/bin/env python2|1' \
    rst2pdf/{findfonts.py,dumpstyle.py}
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
