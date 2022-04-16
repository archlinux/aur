# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=comictagger
pkgver=1.3.2.alpha.4
pkgrel=2
pkgdesc='Application for writing metadata to digital comics, written in Python and PyQt'
arch=(any)
url='https://github.com/comictagger/comictagger'
license=(Apache)
depends=(python
         python-beautifulsoup4
         python-natsort
         python-pillow
         python-requests
         python-pycountry
         python-py7zr
         python-unrar-cffi
         python-pyqt5
         python-pybcj
         python-brotli
)
makedepends=(python-{build,installer}
             python-setuptools-scm
             python-wheel)
makedepends+=(git)
_tag=1.3.2-alpha.4
source=(git+https://github.com/comictagger/comictagger.git#tag=$_tag)
sha256sums=('SKIP')

pkgver() {
  cd comictagger
  printf "${_tag//-/.}"
}

build() {
  cd comictagger
  python -m build -wn
}

package() {
  cd comictagger
  python -m installer -d "$pkgdir" dist/*.whl

  sed -e 's|/usr/local/share/comictagger/app.png|/usr/share/icons/comictagger.png|g' \
      -e 's|%%CTSCRIPT%% %F|/usr/bin/comictagger|g' \
      -i desktop-integration/linux/ComicTagger.desktop

  install -Dm644 desktop-integration/linux/ComicTagger.desktop \
    "$pkgdir"/usr/share/applications/comictagger.desktop
  install -Dm644 comictaggerlib/graphics/app.png \
    "$pkgdir"/usr/share/icons/comictagger.png
}
