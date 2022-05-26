# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=python-textract
_name=textract
pkgver=1.6.5
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
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
        make-dependencies-optional.patch)
sha1sums=('f5f9ef418288e9527e6fe2566f9c9a07a2cec808'
          '421fc9b8674b9df0e3d6cefd3b67de736c849dab')
sha256sums=('68f0f09056885821e6c43d8538987518daa94057c306679f2857cc5ee66ad850'
            '398684c8f94f10c4cc64646520d96322d35f7309533332bb128956587fd362f4')

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
