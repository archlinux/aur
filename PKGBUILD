# Maintainer: Camden Cheek <ccheek22@gmail.com>
pkgname='python-adb-git'
pkgver=r65.fb09de9
pkgrel=3
pkgdesc="Python ADB + Fastboot implementation"
arch=('any')
url="https://github.com/google/python-adb.git"
license=('apachev2')
depends=('libusb>=1.0.16' 'python-libusb1>=1.2.0')
makedepends=('git' 'python2>=2.7')
provides=()
conflicts=()
replaces=()
source=('git+https://github.com/google/python-adb.git')
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
  cd "${srcdir}/python-adb"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "${srcdir}/python-adb"
    python2 setup.py build
}

package() {
  cd "${srcdir}/python-adb"
  python2 setup.py install --root="$pkgdir" --optimize=1 || return 1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
