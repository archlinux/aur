# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname=pyidm
pkgver=2020.6.27
pkgrel=1
pkgdesc="Python open source alternative to IDM (Internet Download Manager)"
arch=('any')
url="https://github.com/pyIDM/PyIDM"
license=('LGPL3')
depends=('python' 
         'python-pysimplegui>=4.18' 
         'python-pyperclip' 
         'python-plyer' 
         'python-certifi' 
         'youtube-dl'
         'python-pycurl' 
         'python-pillow')
makedepends=('python-setuptools' 'python-pip')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyIDM/PyIDM/archive/$pkgver.tar.gz")
b2sums=('a697c73d85956920e0ad859dea7bb1f2c4b7dc8a36ccfaabb893553bf037b464945dce482ba2cb8793f25ded2499e9ceaa87e07c250aa764d400d0997a79a20b')

build() {
  cd "$srcdir/PyIDM-$pkgver"

   python setup.py build
}

package() {
  cd "$srcdir/PyIDM-$pkgver"

  pip install pystray

  python setup.py install --root="$pkgdir" --skip-build -O2

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
