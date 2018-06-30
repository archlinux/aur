# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Otto Sabart <seberm[at]seberm[dot]com>
# Contributor: Mizuchi <ytj000+AUR@gmail.com>
# Contributor: Veli-Jussi Raitila <vjr AT iki DOT fi>

pkgbase=python-pysrt
pkgname=(python-pysrt python2-pysrt)
pkgver=1.1.1
pkgrel=3
pkgdesc="Python parser for SubRip (srt) files"
arch=('any')
url="https://github.com/byroot/pysrt"
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools' 'python-chardet' 'python2-chardet' 'git')
checkdepends=('python-nose' 'python2-nose')
source=("git+https://github.com/byroot/pysrt.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a pysrt{,-py2}
}

build() {
  cd "$srcdir"/pysrt
  python setup.py build

  cd "$srcdir"/pysrt-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/pysrt
  nosetests3

  cd "$srcdir"/pysrt-py2
  nosetests2
}

package_python-pysrt() {
  depends=('python-chardet')
  optdepends=('python-setuptools: for srt script')

  cd pysrt  
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pysrt() {
  depends=('python2-chardet')
  optdepends=('python2-setuptools: for srt2 script')

  cd pysrt-py2
  python2 setup.py install --root="$pkgdir" --optimize=1

  mv "$pkgdir/usr/bin/srt"{,2}
}
