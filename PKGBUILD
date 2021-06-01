# Maintainer: Ragnar Groot Koerkamp <ragnar.grootkoerakmp[at]gmail[dot]com>
_pkgbase='pyexiftool'
pkgname='python-pyexiftool-nocheck'
_pkgname='python-pyexiftool'
pkgver=0.2.0
pkgrel=2

provides=('python-pyexiftool')
conflicts=('python-pyexiftool')

pkgdesc="Library to communicate with an instance of ExifTool command-line application, without python2 and without broken checks."
url="https://github.com/smarnach/pyexiftool"
arch=('any')
license=('GPL3')
makedepends=('python' 'python-sphinx' 'perl-image-exiftool')
options=('!makeflags')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/smarnach/${_pkgbase}/archive/v${pkgver}.tar.gz)
md5sums=('37ea1d935321858b386abc314fca024d')


build() {
  cd ${_pkgbase}-${pkgver}
  make -C doc man text
}

package() {
  depends=('python' 'perl-image-exiftool')
  cd ${_pkgbase}-${pkgver}
  python setup.py install -O1 --prefix=/usr --root="${pkgdir}"
  install -Dm 644 doc/_build/text/index.txt "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm 644 doc/_build/man/${_pkgbase}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}

# vim: ts=2 sw=2 et:
