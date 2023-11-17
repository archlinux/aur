# Maintainer: Vekhir <vekhir AT yahoo DOT com>

pkgname='subtitld'
pkgver=23.02
pkgrel=3
pkgdesc='Subtitld: An open source software to create, edit and transcribe subtitles'
arch=('any')
url='https://www.subtitld.org/'
license=('GPL3')
depends=('python' 'pyside6' 'python-pyffms2' 'python-mpv'
         'python-opengl' 'python-numpy' 'python-cffi' 'python-requests' 'python-pycaption'
         'python-pysubs2' 'python-cleantext' 'python-translate' 'python-speechrecognition'
         'python-docx' 'python-google-api-python-client' 'python-setuptools'
         'python-pysrt' 'python-certifi' 'python-i18n' 'python-importlib-metadata'
         'python-beautifulsoup4' 'python-lxml' 'python-six' 'python-chardet'
         'hicolor-icon-theme'
)
source=("https://gitlab.com/jonata/$pkgname/-/archive/$pkgver/${pkgname}-${pkgver}.tar.gz"
        "remove-gpu-hwdec-interop.patch")
sha256sums=('83381cd697fa4355bc0d4689dfc063efe9ec41c8e177b8e55e35b7b4e6af3ace'
            'fe4288ee0bbde13e4cf20f9c55c7bc973e8928fd37da50b2c05038205ecf20d5')

prepare() {
  cd ${pkgname}-${pkgver}/
  patch -p1 < ../remove-gpu-hwdec-interop.patch
}

build() {
  cd ${pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}/
  python setup.py install --root="$pkgdir" --optimize=1
}
