# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>
# Contributor: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=ffmulticonverter
pkgver=1.7.0
pkgrel=4
pkgdesc="Convert audio, video, image and document files between all popular formats"
arch=(any)
url="https://sites.google.com/site/ffmulticonverter/"
license=('GPL3')
depends=('python-pyqt4')
optdepends=('ffmpeg: for video conversions'
            'imagemagick: for image conversions'
            'unoconv: for document conversions')
conflicts=('ffmulticonverter-git')
source=(https://sourceforge.net/projects/ffmulticonv/files/$pkgname-$pkgver.tar.gz
	make-compatible-with-pyqt4-4.11.4.patch)
sha256sums=('d466c59a7c5c71bae5660924a4d89523bdceeab5f3b38d9d4f8d9f62c16f8c69'
            '470eea40610656629c236c3a71db0d70651f3ca63d31b533d18aeaf997f9f91b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # make compatible with pyqt 4.11.4 and above
  patch -p1 -i "${srcdir}/make-compatible-with-pyqt4-4.11.4.patch"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
