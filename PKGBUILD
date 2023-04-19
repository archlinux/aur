pkgname=python2-volatility-git
__pkgname=${pkgname%-git}
_pkgname=${__pkgname#python2-}
pkgver=2.6.r293.a438e76
pkgrel=1
pkgdesc='An advanced memory forensics framework'
arch=('any')
url='http://volatilityfoundation.org'
license=('GPL')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('python2' 'python2-pycryptodome' 'python2-distorm')
source=("${_pkgname}::git+https://github.com/volatilityfoundation/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${_pkgname}"
        printf "%s" "$(git describe --long --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${_pkgname}"
  python2 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  ln -s /usr/bin/vol.py "$pkgdir/usr/bin/volatility2"
}
