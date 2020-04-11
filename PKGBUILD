#Maintainer: CubeTheThird <cubethethird@gmail.com>

pkgname=rgain3
_pkgbase=rgain
pkgver=1.0.0
pkgrel=1
pkgdesc="Modules to read, write and calculate Replay Gain - Python3 fork"
arch=('any')
url="https://github.com/chaudum/rgain"
license=('GPL2')
depends=('python-mutagen' 'gst-python' 'gst-plugins-good')
makedepends=('python-docutils' 'python-setuptools')
optdepends=('gst-plugins-bad' 'gst-plugins-ugly')
options=(!emptydirs)
source=(${_pkgbase}-${pkgver}.tar.gz::https://github.com/chaudum/rgain/archive/${pkgver}.tar.gz)
md5sums=('89ecb7c316435a1fb3897ab60fcdc59a')

prepare() {
  cd "$srcdir/${_pkgbase}-${pkgver}"
  #remove explicit external module reference
  find . -name \*.py -exec sed -i 's/[^ ]*extern\.//' {} \;
}

build() {
  cd "$srcdir/${_pkgbase}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgbase}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 build/man/collectiongain.1 "${pkgdir}/usr/share/man/man1/"
  install -m644 build/man/replaygain.1 "${pkgdir}/usr/share/man/man1/"
}
