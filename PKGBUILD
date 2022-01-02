# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=python-textract
_name=textract
pkgver=1.6.4
pkgrel=1
pkgdesc="Extract text from any document. No muss. No fuss."
arch=('any')
url="https://github.com/deanmalmgren/textract"
license=('MIT')
depends=('python'
         'python-argcomplete'
         'python-chardet'
         'python-six')
makedepends=('python-setuptools')
# requirements/debian
# requirements/python
optdepends=('antiword: .doc support'
            'docx2txt: .docx support'
            'pocketsphinx: audio support'
            'poppler: .pdf support'
            'python-beautifulsoup4: .html and .htm support'
            'python-pdfminer: .pdf support'
            'python-pptx: .pptx support'
            'python-speechrecognition: audio support'
            'python-xlrd: .xls and .xlsx support'
            'sox: audio support'
            'unrtf: .rtf support')
source=(https://files.pythonhosted.org/packages/28/8e/c3aa0592e54c6317685301af18fdb9f3e5bf39ca9cf57bc65a350ad9b80b/$_name-$pkgver.tar.gz
        make-dependencies-optional.patch)
sha1sums=('c607f1a2354433136b5a885e67aa2deb51571a4b'
          '66ea6d7430cc98f0b498880d91756677593e03e9')
sha256sums=('35ac0302e2dbe53eb8d513b4cf0741264ea89a695fd89a3d48e3bd94d517cef6'
            'e24c8c40fe65d95d3a0fd395b943312205029003c94e29081f860dd42ddba0e0')

prepare() {
  cd "$_name-$pkgver"
  # Make all of the hardcoded dependencies optional and reference them in
  # optdepends. I don't want to install each and every parser library under the
  # sun, even if I don't need them. Furthermore, not all of them are availabe
  # in Arch or AUR.
  patch -p1 -i "$srcdir/make-dependencies-optional.patch"
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
