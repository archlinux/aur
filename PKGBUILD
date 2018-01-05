# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sk1libs
pkgver=0.9.2
pkgrel=2
pkgdesc='A set of python non-GUI extensions for sK1 Project.'
arch=('x86_64')
url='http://sk1project.org/'
license=('custom:LGPL2')
depends=('python2' 'freetype2' 'lcms')
source=("${pkgname}-${pkgver}.tar.gz::https://sk1.googlecode.com/files/sk1libs-${pkgver}pre_rev1383.tar.gz")
md5sums=('fdbb198779ff9941a8912438802fc05a')

prepare() {
  cd ${pkgname}-${pkgver}pre
  sed -i 's|freetype/|freetype2/|g' src/imaging/libimagingft/_imagingft.c
}

build() {
  cd ${pkgname}-${pkgver}pre
  python2 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}pre
  python2 setup.py install --root "$pkgdir"
  install -D -m644 GNU_LGPL_v2 "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
