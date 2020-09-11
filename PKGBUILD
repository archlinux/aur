# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Kwpolska <kwpolska@kwpolska.tk>
pkgname=python-pillow-git
pkgver=7.2.0.r319.g7e06a91c
pkgrel=1
_appname=Pillow
_py3basever=3.8
pkgdesc="Python Imaging Library (PIL) fork."
arch=('x86_64')
url="https://python-pillow.github.io/"
license=('BSD')

depends=('python' 'lcms2' 'libtiff' 'openjpeg2' 'libimagequant' 'libxcb')
optdepends=('freetype2: for the ImageFont module'
            'libraqm: for complex text scripts'
            'libwebp: for webp images'
            'tk: for the ImageTK module'
            'python-olefile: OLE2 file support'
            'python-pyqt5: for the ImageQt module')
makedepends=('python-setuptools' 'freetype2' 'libraqm' 'libwebp' 'tk' 'git')
options=(!emptydirs)
provides=('python-pillow')
conflicts=('python-pillow')
source=('git+https://github.com/python-pillow/Pillow.git')
md5sums=('SKIP')


pkgver() {
  cd "$_appname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_appname"
  python setup.py build
}

package() {
  cd "$srcdir/$_appname"
  python3 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/include/python$_py3basever/"
  install -m644 -t "$pkgdir/usr/include/python$_py3basever/" src/libImaging/*.h
}


