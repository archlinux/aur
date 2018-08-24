# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sk1libs
pkgver=0.9.1
pkgrel=3
pkgdesc='A set of python non-GUI extensions for sK1 Project.'
arch=('x86_64')
url='http://sk1project.org/'
license=('custom:LGPL2')
depends=('python2' 'freetype2' 'lcms')
source=("${pkgname}-${pkgver}.tar.gz::https://sk1project.net/dc.php?target=${pkgname}-${pkgver}.tar.gz")
sha256sums=('bb44520a5fab2998a8013a91874ff109f25bbd8e01bbddafe0b6e7db0631719a')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's|freetype/|freetype2/freetype/|g' src/imaging/libimagingft/_imagingft.c
}

build() {
  cd ${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python2 setup.py install --root "$pkgdir"
  install -D -m644 GNU_LGPL_v2 "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
