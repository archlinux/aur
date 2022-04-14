# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=comictagger
pkgver=1.3.2.alpha.4
pkgrel=1
pkgdesc='Application for writing metadata to digital comics, written in Python and PyQt'
arch=(any)
url='https://github.com/comictagger/comictagger'
license=(Apache)
makedepends=('git' 'python-setuptools')
depends=('python'
    'python-beautifulsoup4'
    'python-natsort'
    'python-pillow'
    'python-requests'
    'python-pycountry'
    'python-py7zr'
    'python-unrar-cffi'
    'python-pyqt5'
    'python-pybcj'
)
_tag=1.3.2-alpha.4
source=(git+https://github.com/comictagger/comictagger.git#tag=$_tag)
sha256sums=('SKIP')

pkgver() {
  cd comictagger
  printf "${_tag//-/.}"
}

build() {
  cd comictagger
  python setup.py build
}

package() {
  cd comictagger
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  sed -e 's|/usr/local/share/comictagger/app.png|/usr/share/icons/comictagger.png|g' \
      -e 's|%%CTSCRIPT%% %F|/usr/bin/comictagger|g' \
      -i desktop-integration/linux/ComicTagger.desktop

  install -Dm644 desktop-integration/linux/ComicTagger.desktop \
    "$pkgdir"/usr/share/applications/comictagger.desktop
  install -Dm644 comictaggerlib/graphics/app.png \
    "$pkgdir"/usr/share/icons/comictagger.png
}
