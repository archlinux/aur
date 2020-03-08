# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=python-textract
_name=textract
pkgver=1.6.3
pkgrel=2
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
source=(https://files.pythonhosted.org/packages/6e/39/b62302c738d872ca9cfb39ebc03b6b565c562289e0941d7379b61d2f147a/$_name-$pkgver.tar.gz
        make-dependencies-optional.patch)
sha1sums=('5ea5b7b5c5b029ed1d8d95c29f92b79cff6b4ca8'
          '6e15f2641fb20f45e68fcfc5cc3f8eab7e1526dd')
sha256sums=('6213b2f923b85af8e5e380241db9361e3f5dbd444a74108745fd4121ae151310'
            'f941cfdda6281a378f40963052b5dce75dcf6e2c49a4246b1571ce9ce9f764f1')

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
