# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=pyexiftool
pkgname=('python-pyexiftool' 'python2-pyexiftool')
pkgver=0.2.0
pkgrel=2
pkgdesc="Library to communicate with an instance of ExifTool command-line application"
url="https://github.com/smarnach/pyexiftool"
arch=('any')
license=('GPL3')
makedepends=('python' 'python2' 'python-sphinx' 'perl-image-exiftool')
options=('!makeflags')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/smarnach/${pkgbase}/archive/v${pkgver}.tar.gz)
sha512sums=('88595c01fa68f7c4d0b604182b6278a53e6a61832b16dfda306a5bb89e767a3629d030a0f0c6a8566e0cf2df4a449b87d39aa40baea91b4267a85824f61d492a')

check() {
  cd ${pkgbase}-${pkgver}
  PYTHONPATH=".:${PYTHONPATH}" python test/test_exiftool.py
  PYTHONPATH=".:${PYTHONPATH}" python2 test/test_exiftool.py
}

build() {
  cd ${pkgbase}-${pkgver}
  make -C doc man text
}

package_python-pyexiftool() {
  depends=('python' 'perl-image-exiftool')
  cd ${pkgbase}-${pkgver}
  python setup.py install -O1 --prefix=/usr --root="${pkgdir}"
  install -Dm 644 doc/_build/text/index.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 doc/_build/man/${pkgbase}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

package_python2-pyexiftool() {
  depends=('python2' 'perl-image-exiftool')
  cd ${pkgbase}-${pkgver}
  python2 setup.py install -O1 --prefix=/usr --root="${pkgdir}"
  install -Dm 644 doc/_build/text/index.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 doc/_build/man/${pkgbase}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
