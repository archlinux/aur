# Maintainer: Firas Zaidan <firas@zaidan.de>

pkgname=('python2-wand')
pkgver=0.4.4.380068e
pkgrel=5
rev=380068e9cc1268a8c20e2fa13621058a68d55cb3
arch=('i686' 'x86_64')
url="https://github.com/dahlia/wand"
license=('MIT')
pkgdesc="Python interface for ImageMagick library (Python 2 build)"
depends=('python2' 'libmagick6')
makedepends=('python2' 'libmagick6')

#source=(https://github.com/dahlia/pywand/archive/${pkgver}.tar.gz)
#sha512sums=('6083f69e539d8b95774c2b3b27f51ac3642fa81dbdf25170141cc3da2fa640b57ba26cf92d16768be4ae345f26a10d289cfc598c2a9bb99625b105a99feba438')
source=(https://github.com/dahlia/wand/archive/${rev}.zip)
sha512sums=('168d8e9b96188d1a12286692c7d2e89b2b5c4415187411c42caa53c29528a2e49476bd33d73d7e5cf11e4acc91d9b106de4c60cf1da2188ad987929a22e274f8')

prepare() {
  mv wand-${rev} ${pkgname}-${pkgver}
}

build() {
  cd ${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/${pkgname}/"
  install -m644 LICENSE "${pkgdir}/usr/share/${pkgname}/"
  mv "${pkgdir}/usr/README.rst" "${pkgdir}/usr/share/${pkgname}/"
}

# See https://github.com/dahlia/wand/issues/201
#check() {
#  cd ${pkgname}-${pkgver}
#  python2 setup.py test
#}
