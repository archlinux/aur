# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
pkgname=rfcat-hg
pkgver=r429.27e14cde402f
pkgrel=1
pkgdesc="RfCat, the swiss army knife of subGHz"
arch=('any')
url='https://bitbucket.org/atlas0fd00m/rfcat'
license=('BSD')
depends=('ipython2' 'python2-pyside' 'python2-pyusb')
makedepends=('mercurial')
provides=("${pkgname%-hg}")
conflicts=("${pkgname%-hg}")
source=("${pkgname}::hg+https://bitbucket.org/atlas0fd00m/rfcat"
        '20-rfcat.rules')
sha256sums=('SKIP'
            'de982a201eb1ba5b2e28f37e409e6c16299e27f49b9db1094997db45fa4b67d7')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "${pkgname}"
  python2 setup.py build
}

package() {
  cd "${pkgname}"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -m644 -D ../20-rfcat.rules "$pkgdir/usr/lib/udev/rules.d/20-rfcat.rules"
}
